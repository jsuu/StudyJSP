
public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String name = null;	//null 4글자 아니고 아무것도 없다
		
		System.out.println((4<2) && (name.length()==4)); //4<2에서 이미 false확정이므로 뒤 연산은 실행하지 않는다. 에러발생안됨
		//     F && ? => 결과는 항상 false 이기 때문에  뒤에 코드 실행 X
		
		System.out.println((4>2) && (name.length()==4));//뒤 연산에 의해 결정되지만 null은 비교할수없으므로 에러발생
		// => T && ? => 뒤연산의 결과에 따라서 값이 변경되기 때문에 실행O
		//   => 코드 자체 에러 실행됨
		
		
		
		
		
	}

}
