package com.newlecture.webapp.dao.spring;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.newlecture.webapp.dao.NoticeDao;
import com.newlecture.webapp.entity.Notice;
import com.newlecture.webapp.entity.NoticeView;

public class SpringNoticeDao implements NoticeDao {
	
	@Autowired
	private JdbcTemplate template;
	
	/*@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}
*/
	@Override
	public List<NoticeView> getList(int page, String field, String query) {
		/*
		String sql="SELECT * FROM NoticeView where ? like ? order by regDate desc limit ?, 10";
		List<NoticeView> list=template.query(
				sql, 
				new Object[] {"'"+field+"'","'%"+query+"%'",(page-1)*10},
				BeanPropertyRowMapper.newInstance(NoticeView.class));
		*/
		String sql="SELECT * FROM NoticeView where "+field+" like ? order by regDate desc limit ?, 10";
		List<NoticeView> list=template.query(
				sql, 
				new Object[] {"%"+query+"%",(page-1)*10},
				BeanPropertyRowMapper.newInstance(NoticeView.class));
		
		return list;
	}

	@Override
	public int getCount() {
		String sql = "select count(id) 'count' from Notice";
		int count = template.queryForObject(sql, Integer.class);
		
		return count;
	}

	@Override
	public NoticeView get(String id) {
		String sql = "select * from Notice where id = ?";
		/*
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://211.238.142.247/newlecture?autoReconnect=true&useSSL=false&useUnicode=true&characterEncoding=UTF-8");
		dataSource.setUsername("sist");
		dataSource.setPassword("cclass");
		
		JdbcTemplate template = new JdbcTemplate();
		template.setDataSource(dataSource);
		*/
		/*NoticeView notice = template.queryForObject(
				sql, new Object[]{id},
				BeanPropertyRowMapper.newInstance(NoticeView.class));
		*/
		NoticeView notice = template.queryForObject(
				sql, new Object[]{id},
				new RowMapper<NoticeView>() {

					@Override
					public NoticeView mapRow(ResultSet rs, int rowNum) throws SQLException {
						
						NoticeView notice = new NoticeView();
						notice.setId(rs.getString("id"));
						notice.setTitle(rs.getString("title")+"�޷շ�");
						notice.setWriterId(rs.getString("writerId"));
						notice.setContent(rs.getString("content"));
						notice.setHit(0);
						
						return notice;
					}
					
				});
		return notice;
	}

	@Override
	public int update(String id, String title, String content) {
		String sql ="update Notice set title=?, content=? where id =?";
		try {
			int result = template.update(sql,title,content,id);
			return result;
			
		} catch (EmptyResultDataAccessException e) {
			return 0;
		}
		/* int result =template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement st) throws SQLException {
				st.setString(1, title);
				st.setString(2, content);
				st.setString(3, id);
			}
		});*/
	}

	@Override
	public NoticeView getPrev(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NoticeView getNext(String id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int insert(String title, String content, String writerId) {
		
		return insert(new Notice(title, content, writerId));
	}

	@Override
	public int insert(Notice notice) {
		String sql = "insert into Notice(id,title,content,writerId) values(?, ?, ?, ?);";
		int result = template.update(sql,
				getNextId(),
				notice.getTitle(),
				notice.getContent(),
				notice.getWriterId()
				);
		
		return result;
	}

	@Override
	public String getNextId() {
		String sql = "select ifnull(max(cast(id as unsigned)),0) + 1 from Notice";
		String result = template.queryForObject(sql, String.class);
		
		System.out.println(result);
		return result;
	}

}
