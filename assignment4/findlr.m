hid = size(small_test_rbm_w,1);
vis = size(small_test_rbm_w,2);
s =exp(small_test_rbm_w);
store = [];
for i=1:hid
 tmp=1;
 for j=1:vis
   tmp*=1+s(i,j);
 end
 store =[store tmp];
end
logv = 0;
for i=0:1023
 v = [];
 s = dec2bin(i,10);
 for c=s
  v=[v,bin2dec(c)];
 end

 for i=1:size(v)
 	if v(i)==1
         logv+=store(i);
        else
         logv+=2^256;
	end
 end
end
log(logv)
  		
