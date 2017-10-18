package com.newlecture.aop.spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Program {
	public static void main(String[] args) {
		//Calculator origin = new NewlecCalculator();
		
		
		//proxy를 생성해서 실제 주업무 로직을 위임
		
		//int data = proxy.add(3, 4);
		
		//System.out.println(data);
		ApplicationContext context = new ClassPathXmlApplicationContext("com/newlecture/aop/spring/aop-context.xml");
		Calculator cal = (Calculator) context.getBean("cal");
		
		
		int data = cal.add(3, 4);
		data = cal.div(3, 0);
		
		//System.out.println(data);
		
	}

}
