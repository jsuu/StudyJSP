package com.itwillbs.test;

public class Student {
	//학생정보를 저장만. ( 실행매서드는 필요없다)
	
	//캡슐화 (private: 자신클래스내.)
	private String name;
	private int kor;
	private int eng;
	private int math;
	
			int test;
	
		//생성자만이 변수값 초기화한다. 변수값을 바꾸는것은 set메서드
		//	public Student() {}   // overload'된 생성자가 없는경우, 기본생성자가 컴파일시 자동으로 만들어짐. 

	// set/get()생성
	// alt + shift + s +r
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	
		
	
}
