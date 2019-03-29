import java.util.*;
class Pattern2
{
	public static void main(String args[])
	{
		Scanner scn = new Scanner(System.in);
		System.out.println("Enter n value");
		int n = scn.nextInt();
		int i,j;
		for(i=1;i<n;i++)
		{
			for(j=0;j<i;j++)
			{
				System.out.print(i);
			}
			System.out.println(" ");
		}
		System.out.print("");
	}
}