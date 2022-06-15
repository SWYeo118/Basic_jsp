package com.jsp.domain.model;

import java.util.Objects;

// <객체지향으로 class를 만들 때 진행할 것>
// 1. 무지성 private 멤버 변수
// 2. 필요하면 생성자 추가
// 3. 무지성 getter / setter 읽기 전용, 쓰기 전용
// 4. 무지성 toString()
// 5. 필요하면 equals / hashCode 재정의 (오버라이드)

// Product라는 클래스 하나를 생성한다.
public class Product {
	
	// 실제로 어떻게 Product 클래스의 속성들이 어떻게 작동하는지를 바로 보여주기 위해서 main method를 내부에 선언하였다.
	
	// 클래스 내부에서 선언된 변수는 '멤버 변수'라고 부르고, 메소드나 생성자 내부에서 선언된 변수는 '지역변수'라고 부른다.
	// 멤버 변수중에서는 클래스변수와 인스턴스 변수가 있다. '클래스 변수'는 변하지 않는 속성으로 지정되어있는 변수이며 'static'이 붙어있는 것이 특징이다.
	// '인스턴스 변수'는 변하는 속성의 변수이며 'static'이 없다.
	
    public static void main(String[] args) {
    	
    	// 생성자를 통해서 이미 String, String, int 형태로 정의가 되었기 때문에 product라는 객체를 다음과 같이 생성해
        Product product = new Product("33", "33", 11);
        System.out.println(product.hashCode());

        Product product2 = new Product("33", "33", 11);
        System.out.println(product2.hashCode());

        Object object = new Product("33", "33", 11);

        System.out.println(product.equals(product2)); // true
        System.out.println(product.hashCode() == product2.hashCode()); // true
        System.out.println(product == product2); // false
    }
    
    // 특정 메소드 내부에서 선언되지 않았으므로 다음의 변수들은 '멤버 변수'들이다.
    // 객체 지향에서 다른 개발자의 인적 오류를 방지하기 위해 변수들에 대해서 private로 모두 설정하였다.
    private String id;
    private String name;
    private int unitPrice;
    private String description;
    private String manufacturer;
    private String category;
    private long unitsInStock;
    private String condition;
    
    // 이클립스의 기능 중 우클릭 - Source - Generate Constructor using fields를 통해서 Constructor를 생성하였다.
    // Constructor란 메소드 중에서 특별히 해당 클래스의 이름과 똑같은 이름을 가진 메소드를 의미하며, 해당 클래스에서 사용할 변수들에 대하여 정의하는 규칙을 생성하는 메소드라고 이해하였다.
    // 아래의 생성자를 보면 String, String, int의 세 값을 받는 경우에, 해당 값들이 이 클래스의 어떠한 변수인지를 정의해준다.
    // 첫 번째 값은 String으로 받으며 id라고 정의되고 이는 멤버 변수(멤버 인스턴스)인 id와 같다는 의미로 this.id = id; 라고 정의하였다.
    // 두 번째 값은 String으로 받으며 name이라고 정의되고 이는 멤버 변수(멤버 인스턴스)인 name과 같다는 의미로 this.name = name; 라고 정의하였다.
    // 세 번째 값은 int으로 받으며 unitPrice라고 정의되고 이는 멤버 변수(멤버 인스턴스)인 unitPrice와 같다는 의미로 this.unitPrice = unitPrice; 라고 정의하였다.
    
    public Product(String id, String name, int unitPrices) {
        this.id = id;
        this.name = name;
        this.unitPrice = unitPrices;
    }
    
    
    // 아래는 getter setter 부분이다. getter는 private하게 설정된 멤버 변수들로부터 값을 받아올 수 있도록 해 주는 method로 어디에서든, 어떤 접근제한자로 제한이 되어있던 상관없이 값을 가져오도록 해준다.
    // 아래의 메소드를 예로 들면 String 타입의 id라는 변수의 값을 가져오는 메소드로 getId라는 메소드가 정의되었으며, 이 메소드는 id값을 return함으로서 값을 가져올 수 있다.
	public String getId() {
		return id;
	}
	
	// 또한 아래의 setId 메소드는 void 속성을 가지기 때문에 값을 리턴해주지 않고 그냥 입력된 값을 새로 지정해주기만 한다. 다만 이 때 set을 통해 값을 지정해준다고 해서 원본 private 변수들의 값이 변화되지 않는다.
	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public long getUnitsInStock() {
		return unitsInStock;
	}

	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	// 각 객체의 hashcode 값을 알려주는 메소드가 id부분에 대해서만 오버라이딩 되었다.
	@Override
    public int hashCode() {
        return Objects.hash(id);
    }
	
	// 각 객체의 값을 비교하고 같은지 확인해주는 equals 메소드를 오버라이딩 하여 id 부분에서 같은지, 다른지를 확인하도록 하였다.
    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        Product other = (Product) obj;
        return Objects.equals(id, other.id);
    }
    
    // 일반적으로 생성자에 값을 넣어 오브젝트를 생성했다고 하더라도 이를 바로 출력하면 그 값의 hashcode만 나타나게 된다. 따라서 이를 우리가 확인할 수 있는 방법으로
    // 출력하기 위해서 toString이라는 메소드를 오버라이드 해서 사용한다. 기본적으로 toString이라는 메소드가 아래의 형식과 같이 지정되어있기 때문에
    // 우리가 원하는 오브젝트들에 대해서 해당 형식대로 출력되게 된다.
    @Override
    public String toString() {
        return "Product [id=" + id + ", name=" + name + ", unitPrice=" + unitPrice
                + ", description=" + description + ", manufacturer=" + manufacturer + ", category="
                + category + ", unitsInStock=" + unitsInStock + ", condition=" + condition + "]";
    }
}