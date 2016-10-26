package todoApp;

import java.util.*;

public class StartApp {

	public static void main(String[] args) {
		
		TodoModel model = new TodoModel();
		
		System.out.println("Create Category");
		System.out.println("Load Category");
		System.out.println("Search");
		System.out.println("List");
		System.out.println("Exit");
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("Enter choice:");
		
		int n = sc.nextInt();
		
		switch(n)
		{
		case 1: 
			System.out.println("Enter filename:");
			String category_name = sc.next();
			boolean exists = model.checkIfCategoryExists(category_name);
			if(exists)
				System.out.println("Category successfully created");
			else
				System.out.println("Given name already exists...Cannot create the required category!!");
			break;
		case 2: 
			
			break;
		case 3: 
			
			break;
		case 4: 
			
			break;
		case 5: 
			
			break;
		default:
			System.out.println("Invalid Option!");
		}
		
		sc.close();

	}

}
