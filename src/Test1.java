class Parent {
	public void pprn() {
		System.out.println("Parent-pprn()");
	}
}

class Child extends Parent {
	public void cprn() {
		System.out.println("Child-cprn()");
	}
}

// * 모든 클래스는 항상 Object를 상속
// => 모든 클래스는 Object로 형변환이 가능하다(업캐스팅)
// => 모든 서브클래스는 부모클래스로 형변환이 가능하다 (업캐스팅)
public class Test1 /* extends Object */ {

	public static void main(String[] args) {

		Parent p = new Parent();
		p.pprn();

		System.out.println("----------------------");

		Child c = new Child();
		c.cprn();
		c.pprn(); // 상속 후 부모의 기능사용
		System.out.println("----------------------");

		// * 참조형타입 형변환
		// ** 상속이 반드시 필요!!!
		// 1) 업캐스팅 : 서브클래스가 슈퍼클래스타입으로 형변환
		// 슈퍼클래스의 레퍼런스에 서브클래스의 객체를 저장
		// 부모 클래스의 참조변수에 자식클래스의 인스턴스를 저장
		// (=> 자동 형변환)
		// 2) 다운캐스팅 : 슈퍼클래스가 서브클래스타입으로 형변환
		// (=> 강제 형변환)
		System.out.println("----------------------");
		System.out.println("업 캐스팅");
		// * 업캐스팅시 상속받은 부분만 사용가능
		// => 데이터 참조영역의 감소

		Parent p1 = new Child();
		p1.pprn();
		// p1.cprn();(x)

		System.out.println("----------------------");
		System.out.println("다운캐스팅");
		// * 기본적으로 다운캐스팅은 자동형변환 X (컴파일에러) => 명시적형변환
		// * 실행시 메모리에 정보가 없으면 객체를 사용 X (실행시 예외)
		// => 존재하지 않을수 있는 영역을 참고할수 없음.

		// Child c1 = new Parent(); //컴파일에러
		// Child c1 = (Child) new Parent();
		// c1.cprn();
		// c1.pprn();
		
		// 안전한 다운캐스팅
		// -> 업캐스팅한 부모객체를 다시 다운캐스팅해서 처리
		// => 업캐스팅 축소된 참조영역이 확대 
		Parent p2 = new Child();
		
		//Child c2 = p2; 
		// 컴파일에러는 발생 - 컴파일러는 실행전에 객체 메모리(상속관계 확인이 어려움)
		Child c2 = (Child) p2;
		c2.cprn();
		c2.pprn();
		
		
		
		
		
		
		

	}
}
