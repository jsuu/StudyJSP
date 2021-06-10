package com.itwillbs.test;
//package명은 회사 도메인주소를 거꾸로. 도메인주소는 중복이 없으므로 중복방지효과.


public class Main {
		
	// 총합 메서드 mySum(int k, int e, int m) 출력 :  인스턴스 메서드
		public double mySum(int k, int e, int m){
		int sum = k + e + m;
		return sum;
	}	
		//overload'
		public void mySum(int k,int e,int m,String name){
			System.out.println(name+"님 총점 : "+(k+e+m));
		}
		//overload' (매개변수:객체)
		public void mySum(Student kim){
			
			System.out.println(kim.getName()+"님 총점 : "+
			    (kim.getKor()+kim.getEng()+kim.getMath())   );
			
		}
	
	// 평균 메서드 myAVG(int k, int e, int m)  출력 : static 메서드
		 public static void myAVG(int k, int e, int m){		
				System.out.println("평균 : "+(k+e+m)/3.0);
				//System.out.println("평균 : "+mySum(k+e+m)/3.0);	 //static메서드 호출시 위의 mySum은 호출전이므로 안됨.
		 }
				public static void main(String[] args){
					
					//학생정보 -> 점수 총합.평균출력
					// 이름, 국, 영, 수
					String name = "홍길동";
					int kor = 57;
					int eng = 80;
					int math = 90;
					
					System.out.println(name + "의 총합: " +(kor+eng+math));
					System.out.println(name + "의  평균: " +(kor+eng+math)/3.0);
					
					System.out.println("----------------");
					
					Main main = new Main();
					
					System.out.println("총합: "+main.mySum(kor, eng, math));
					
					myAVG(kor, eng, math);
					
					System.out.println("------------------------------");
					
					Student kim = new Student();
					kim.test = 100;
		//			kim.name = "홍길동";	//private
					
					kim.setName("홍길동");
					kim.getName();
		
					// "김학생 국:77,영:88,수:99" 총점 계산
					// 위 학생정보를 사용해서 총점을 출력하는 메서드를 오버로딩
		
					
					Student jung = new Student();
					jung.setName("정학생");
					jung.setKor(77);
					jung.setEng(88);
					jung.setMath(99);
					
					main.mySum(jung);
					main.mySum(jung.getKor(), jung.getEng(), jung.getMath());
				
					System.out.println("------------------------------");
					
					// 동작 분리 -> 계산하는 메서드 동작을 분리			
					// Cal 객체 - 총점/평균메서드 구현
					// 계산기 객체
					Cal c = new Cal();
					System.out.println(c.Cal_Sum("홍길동", 100, 50, 70));
					
					Student stu = new Student();
					stu.setName("홍길동");
					stu.setKor(100);
					stu.setEng(50);
					stu.setMath(70);
					
					System.out.println(c.Cal_Sum(stu));
					
					c.Cal_Avg(stu);
					
				}//main()ㄴ
			
	}//class
		

