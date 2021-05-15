n = read("input.txt");
nb = n-1;
m = 0;
while(nb%2 == 0, m = m+1; nb = nb/2);
\\print(m);

\\Puisque le test de Miller Rabin a reconnu que n etait composé, il existe a != -1 ou 1, tel que a^2 = 1 dans Z/nZ, et il suffit alors de prendre pgcd(a+1,n) et pgcd(a-1,n) pour obtenir les facteurs de n.

sol = Mod(0, n);

while(sol == Mod(0, n), a = random({n}); amod_m = Mod(a, n)^nb; b = amod_m^2; c = b^2; d = c^2; if(d == Mod(1, n) && c != Mod(1, n) && c != Mod(n-1, n), sol = c); if(c == Mod(1, n) && b != Mod(1, n) && b != Mod(n-1, n), sol = b); if(b == Mod(1, n) && amod_m != Mod(1, n) && amod_m != Mod(n-1, n), sol = amod_m);)

s = lift(sol);

p = gcd(n, s-1);
q = gcd(n, s+1);

print(p);
\\print(q);
