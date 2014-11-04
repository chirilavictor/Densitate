#mai intai citim fisierul unde avem articolul ale carui cuvinte 
#vrem sa la aflam densitatea
articol = File.open("articol.txt", "r"){ |f| f.read.split }
articol.each { |x| x.downcase! }#le punem intr-un array si le rescriem cu litere mici totodata
#print articol

#cu metoda injection cream un hash din array-ul nostru unde cheile sunt cuvintele iar valoarea este numarul de aparitii ale acelor cuvinte in articol
hash_cuv = articol.inject(Hash.new(0)) { |k,v| k[v] += 1; k }
#puts hash_cuv

#acum vom crea un nou fisier unde vom pune hash-ul nostru ordonat descrescator
output = File.new("dens3.txt", "w") 
output.print hash_cuv.sort_by { |k,v| v }.reverse
output.close

#hash_cuv.sort { |a,b| a[1] <=> b[1] }
=begin
 hash_cuv.sort_by { |k,v| v }.reverse
 #puts hash_cuv
 h = {
 	"z" => 9,
 	"b" => 4,
 	"c" => 5
 }

h_arr1 = h.keys.sort!#_by { |k, v| v }
puts h_arr1
puts h
=end
