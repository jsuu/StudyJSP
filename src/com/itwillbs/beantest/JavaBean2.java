package com.itwillbs.beantest;

public class JavaBean2 {
	
	//DB테이블 컬럼명 == 자바빈 변수명 == 파라미터 이름.
	private String id;
	private String pass;
	private int age;
	private String tel;
	


	// 기본생성자 public JavaBean1() {}
	
	// set/get()생성
	// alt + shift + s +r
	
	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "JavaBean2 [id=" + id + ", pass=" + pass + ", age=" + age + ", tel=" + tel + "]";
	}


	//메서드 오버라이드 (전제조건: 상속)   *오버로드는 상속과는 무관.
	// 	// alt + shift + s +v
	 //여기서 JavaBean1은 Object를 상속하여 toString()를 오버라이드 
	
//	@Override
//	public String toString() {
//		// TODO Auto-generated method stub
////		return super.toString();	//부모super의  OBJECT의 메서드를 부른다
//		return "메소드오버라이딩";
//	}
	
	
	

}
