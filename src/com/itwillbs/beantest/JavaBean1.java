package com.itwillbs.beantest;

public class JavaBean1 {
	
	//DB테이블 컬럼명 == 자바빈 변수명 == 파라미터 이름.
	private String id;


	// 기본생성자 public JavaBean1() {}
	
	// set/get()생성
	// alt + shift + s +r
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}

	// alt + shift + s + s  자바빈객체 내용 확인!
	@Override
	public String toString() {
		return "JavaBean1 [id=" + id + "]";
	}


	//메서드 오버라이드 (전제조건: 상속)   오버로드는 상속과는 무관.
	// 	// alt + shift + s +v
	 //여기서 JavaBean1은 Object를 상속하여 toString()를 오버라이드 
	
//	@Override
//	public String toString() {
//		// TODO Auto-generated method stub
////		return super.toString();	//부모super의  OBJECT의 메서드를 부른다
//		return "메소드오버라이딩";
//	}
	
	
	

}
