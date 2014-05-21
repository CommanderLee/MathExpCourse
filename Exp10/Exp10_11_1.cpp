/*
ID: lizhen11
PROG: Exp10.11.1
LANG: C++
*/
#include<iostream>
#include<fstream>
#include<cstring>
#include<cstdio>
#include<string>
#include<cstdlib>

using namespace std;

int main()
{
	int len[4] = {290, 315, 350, 455};
	int total = 1850;
	int limit = 100;
	
	int maxni = total / 290;
	int maxnum = 5;
	int sum = 0;
	int no(1);
	
	ofstream fout("sol.txt");
	
	for (int n0 = 0; n0 < maxni; ++n0)
	{
		sum = n0 * len[0];
		if (sum < total)
		{
			for (int n1 = 0; n1 < maxni; ++n1)
			{
				if (sum + n1 * len[1] < total)
				{
					sum += n1 * len[1];
					for (int n2 = 0; n2 < maxni; ++n2)
					{
						if (sum + n2 * len[2] < total)
						{
							sum += n2 * len[2];
							int n3 = (total - sum) / len[3];
							if ((total - sum) % len[3] <= limit && n0 + n1 + n2 + n3 <= maxnum)
							{
								printf("No.%d:, n: %d, %d, %d, %d, other: %d\n", no, n0, n1, n2, n3, (total - sum) % len[3]);
								fout << no << ' ' << n0 << ' ' << n1 << ' ' << n2 << ' ' << n3 << ' ' << (total - sum) % len[3] << endl;
								++no;
							}
							sum -= n2 * len[2];
						}
					}
					sum -= n1 * len[1];
				}
			}
		}
	}
	fout.close();
    system("pause");
    return 0;
}
