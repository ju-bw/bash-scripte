if [ `ls -a  tex | wc -l` -gt 2 ]; then 
  echo "verz. voll"  
else
  echo "Fehler: verz. leer";
fi

#  Befehle zum Vergleichen
eq = equal            = Gleichheit
ne = not equal        = Ungleichheit
le = lesser or equal  = kleiner oder gleich
ge = greater or equal = größer oder gleich
gt = greater than     = größer als