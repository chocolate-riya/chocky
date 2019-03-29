import java.util.*;
class Pattern1
{
	public static void main(String[] args)
	{
		Scanner scn = new Scanner(System.in);
		System.out.println("Enter n value");
		int n = scn.nextInt();
		int i,j;
		for(i = 0; i<n;i++)
		{
			for(j=0;j<n;j++)
			{
				System.out.print("*");
			}
			System.out.println(" ");
		}
		System.out.print(" ");
	}
}