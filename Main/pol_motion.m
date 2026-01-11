function Rm=pol_motion(xp,yp)

xp=dms2degrees([0 0 xp]);
yp=dms2degrees([0 0 yp]);
Rm=R2(-xp)*R1(-yp);

%dikkat et dakika verirse
