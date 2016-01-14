
// SOLUTION FILE
#include <stdio.h>
#include <iostream>

using namespace std;
main()
{
  int var_int;                    // 2
  string hello;
  char foo;

  unsigned char uchar1, uchar2;   // 3
  signed char schar1, schar2;

  int x, y;                       // 4

  char i;                         // 5
  char shift_char;

  int a[10] = {0,10,20,30,40,50,60,70,80,90};    // 6

  int b[10], c[10];               // 7
  int *ip, *ip2;
  int j, k;

  char AString[] = "HAL";           // 8

  // 1 -- change "World" to your name
  printf("\n\n PART 1 ---------\n");

  printf("\n Hello Ding Qin! \n");

  // 2 -- find sizes of the other C datatypes
  printf("\n\n PART 2 ----------\n");
  printf("\n size of data type string = %d ", sizeof(hello));
  printf("\n size of data type int = %d ", sizeof(var_int));
  printf("\n size of data type char = %d ", sizeof(foo));



  // 3 -- explore signed versus unsigned datatypes and their interactions
  printf("\n\n PART 3 ----------\n");

  uchar1 = 0xFF;
  uchar2 = 0xFE;
  schar1 = 0xFF;
  schar2 = 0xFE;

  printf("\n uchar1 = %d ", uchar1);
  printf("\n schar1 = %d ", schar1);
  if (uchar2 < uchar1)
  {
    printf("\n uchar1 is greater with the value: %d",uchar1);
  }
  else
  {
    printf("\n uchar2 is greater with the value: %d", uchar2 );
  }
  if (schar2 < schar1)
  {
    printf("\n schar1 is greater with the value: %d",schar1);
  }
  else
  {
    printf("\n schar2 is greater with the value: %d", schar2 );
  }
  if (schar1 < uchar1)
  {
    printf("\n uchar1 is greater with the value: %d",uchar1);
  }
  else
  {
    printf("\n schar1 is greater with the value: %d", schar1 );
  }

  printf("\n the value of schar1+schar2 is %d ",schar1+schar2);
  printf("\n the value of uchar1+uchar2 is %d ",uchar1+uchar2);
  printf("\n the value of uchar1+schar1 is %d ",uchar1+schar1);
  //1) the outputs are different for uchar1 and schar1 even though they have the same hex number is because uchar1 is unsigned and schar1 is signed. So when converting the hex value into a decimal value,
  // the most significant bit for the signed will indicate its a negative, while the most significant bit for the unsigned will just represent a decimal number that is 2^n. 

  //2) It compared the value after it is coverted from hex and outputs the bigger value. 

  //3) the sum is -3. This is what i expected. This is the value of the sums of the signed hex numbers of -1 and -2. 

  //4) the sum is 509. This is the value of the converted hex added together. 

  //5) the sum is 254. the value of 255 and -1 summed together. 


  // 4 -- Booleans
  printf("\n\n PART 4 ----------\n");

  x = 1; y = 2;
  bool L = true;
  bool e = false;
  printf("\n this is the value of true %d", L );
  printf("\n this is the value of false %d", e );
  printf("\n the size of a boolean data type is %d", sizeof(L));

  if ( true && L )
  {
    printf("\n this is a logical AND");
  }

  int bitnumber = 10&8;
  if( bitnumber == 8)
  {
    printf("\n this is a bitwise AND");
  }

  if (x != y)
  {
    printf("\n this is a logical NOT");
  }

  if(~x == -2)
  {
    printf("\n this is a bitwise NOT");
  }

  // 5 -- shifts
  printf("\n\n PART 5 ----------\n");

  shift_char = 15;
  i = 1;

  printf("\n shift_char << %d = %d", i, shift_char << i);
  printf("\n shift_char << %d = %d",(i+1), shift_char << (i+1));
  printf("\n shift_char >> %d = %d",(i+1), shift_char >> (i+1)); // when you shift left or right by 2 spaces, you get either 60 or 3
  printf("\n shift_char << %d = %d",(i+3), shift_char << (i+3)); // when you shift left 4 spaces you get 240. This happens because 15 in binary is 1111 and when you shift left 4 spaces, it becomes 11110000, which is 240.
  printf("\n shift_char << %d = %d", (i+8), shift_char<< (i+8)); // the value becomes 7680

  // 6 -- pointer basics
  printf("\n\n PART 6 ----------\n");

  ip = a;
  printf("\nstart %d %d %d %d %d %d %d \n",
    a[1], *(ip+1), *(ip+2), *(ip+1), *(ip+2), *(ip+5), *(ip+1));

  printf("\n the size of the pointer is %d", sizeof(ip)); // size is 8? not 4? 
  printf("\n the pointer value is %x and %x", ip, ip+1); // this outputs the address of the register the pointer is pointing to. The difference between ip and ip+1 is not 1 because each elements takes up 4 bytes of meemory. 


  // 7 -- programming with pointers
  printf("\n\n PART 7 ----------\n");
  int switcher = 9;
  int switcher2 =9;

  printf("\n this is array b ");
  for (int z=0; z<10;z++)
  {

    b[z]=a[switcher];
    switcher--;
    printf("%d ", b[z]);
    

  }


  printf("\n\n");
  ip2 = a;
  printf("\n this is array c ");
  for (int loop = 0; loop<10;loop++ )
  {
    c[loop]=*(ip+switcher2);
    switcher2--;
    printf( "%d ",c[loop]);
  }

  printf("\n\n");
  printf("\n This is the original array ");
  for(int input = 0; input <10 ; input++)
  {
    printf("%d ", a[input]);
  }

  // 8 -- strings
  printf("\n\n PART 8 ----------\n");

  printf("\n %s \n", AString);

  // NEW CODE
  for (k = 0; k < 4; k++) 
  {
    printf("\n %d", AString[k]);
  }
  for (k = 0; k < 3; k++) AString[k] += 1;
    printf("\n My name is %s. \n", AString);

  AString[3] += 60;
  printf("\n %s \n", AString);

  for (k = 0; k < 10; k++) printf("\n %d", AString[k]);

  // 9 -- address calculation
    for (k = 0; k < 10; k++) 
    {
      b[k] = a[k];         // direct reference to array element
    printf("\n address of b: %x", &b[k]);
    printf("\n address of a: %x", &a[k]);

    }
  ip = a;
  ip2 = b;

  for (k = 0; k < 10; k++) 
  {
     printf("\n address of 2: %x", ip2);
    printf("\n address of 1: %x", ip);
    *ip2++ = *ip++;     // indirect reference to array element
   
  }
  // all done
  printf("\n\n ALL DONE\n");
}
