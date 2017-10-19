package com.newlecture.webapp.dao.spring;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.newlecture.webapp.dao.NoticeDao;
import com.newlecture.webapp.entity.Notice;
import com.newlecture.webapp.entity.NoticeView;

public class SpringNoticeDao implements NoticeDao {
	
	private JdbcTemplate template;
	
	
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

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
						notice.setTitle(rs.getString("title")+"¸Þ·Õ·Õ");
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
		// TODO Auto-generated method stub
		return 0;
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
	public int insert(Notice notice) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(String title, String content, String writerId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String getNextId() {
		// TODO Auto-generated method stub
		return null;
	}

}
