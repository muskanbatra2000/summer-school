
  system("cls");
        gotoxy(25,2);
        cout<<"Bill Details";
        gotoxy(25,3);
        cout<<"================\n\n";
        cout<<"\n\t\t1.All Items\n\n";
        cout<<"\t\t2.Back to Main menu\n\n";
        cout<<"\t\tPlease Enter Required Option: ";
        int cho;
        cin>>cho;
        if(cho==1)
        {
            system("cls");
            gotoxy(30,3);
            cout<<" BILL DETAILS ";
            gotoxy(3,5);
            cout<<"ITEM NO";
            gotoxy(13,5);
            cout<<"NAME";
            gotoxy(23,5);
            cout<<"PRICE";
            gotoxy(33,5);
            cout<<"QUANTITY";
            gotoxy(44,5);
            cout<<"TAX %";
            gotoxy(52,5);
            cout<<"DISCOUNT %";
            gotoxy(64,5);
            cout<<"NET AMOUNT";
OAOAOAOAOAOAOAOAOAOA            fin.open("itemstore.dat",ios::binary);
            if(!fin)
OAOAOAOA            {
                cout<<"\n\nFile Not Found...";
OAOAOAOAOAOA                goto menu;
            }
OA            fin.seekg(0);
            gtotal=0;
OAOAOAOAOAOAOAOA            while(!fin.eof())
            {
OAOAOA                fin.read((char*)&amt,sizeof(amt));
                if(!fin.eof())
OAOAOAOAOA                {
                    amt.report();
OAOA                    gtotal+=amt.retnetamt();
                    ff=0;
OAOA                }
                if(ff!=0) gtotal=0;
            }
            gotoxy(17,k);
            cout<<"\n\n\n\t\t\tGrand Total="<<gtotal;
            getch();
            fin.close();
        }
        if(cho==2)
        {
            goto menu;
        }
OAOAOAOAOAOAOAOAOAOAOA        goto ss;
OAOAOAOAOAOAOAOAOAOAOA    case 2:
OAOAdb:
OAOAOAOAOAOAOAOAOAOAOA        system("cls");
OAOAOAOAOAOAOAOAOAOAOA        gotoxy(25,2);
        cout<<"Bill Editor";
OAOAOAOAOAOAOAOAOAOAOAOAOAOAOA        gotoxy(25,3);
        cout<<"=================\n\n";
OAOAOAOAOAOAOAOAOAOAOAOAOA        cout<<"\n\t\t1.Add Item Details\n\n";
        cout<<"\t\t2.Edit Item Details\n\n";
OAOAOAOAOAOA        cout<<"\t\t3.Delete Item Details\n\n";
        cout<<"\t\t4.Back to Main Menu ";
OAOAOAOAOAOAOAOAOA        int apc;
        cin>>apc;
        switch(apc)
        {
        case 1:
            fout.open("itemstore.dat",ios::binary|ios::app);
            amt.add();
            cout<<"\n\t\tItem Added Successfully!";
            getch();
            goto db;

        case 2:
            int ino;
            flag=0;
OAOAOAOA            cout<<"\n\n\tEnter Item Number to be Edited :";
OAOAOAOAOA            cin>>ino;
OAOAOAOAOAOAOAOA            fin.open("itemstore.dat",ios::binary);
            fout.open("itemstore.dat",ios::binary|ios::app);
OAOAOA            if(!fin)
OAOAOAOAOAOAOAOAOAOAOAOAOAOAOA            {
                cout<<"\n\nFile Not Found...";
OAOAOAOAOAOAOAOAOAOAOAOAOA                goto menu;
            }
OAOAOAOAOAOAOAOAOAOAOAOAOA            fin.seekg(0);
            r=0;
            while(!fin.eof())
OAOAOAOAOAOAOAOA            {
OAOAOAOAOAOA                fin.read((char*)&amt,sizeof(amt));
                if(!fin.eof())
OAOAOAOA                {
                    int x=amt.item::retno();
OAOA                    if(x==ino)
                    {
                        flag=1;
                        fout.seekp(r*sizeof(amt));
                        system("cls");
                        cout<<"\n\t\tCurrent Details are\n";
                        amt.show();
                        cout<<"\n\n\t\tEnter New Details\n";
                        amt.add();
                        cout<<"\n\t\tItem Details editted";
                    }
                }
                r++;
            }
            if(flag==0)
            {
                cout<<"\n\t\tItem No does not exist...Please Retry!";
                getch();
                goto db;
            }
            fin.close();
            getch();
            goto db;


