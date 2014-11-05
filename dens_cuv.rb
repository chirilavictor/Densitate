#mai întâi citim fișierul unde avem articolul ale cărui cuvinte 
#vrem să le aflăm densitatea
#am încercat să import cartea lui Mihai dar am aflat că fișierele .pdf se citesc diferit și ar trebui să cercetez mai mult
articol = File.open("articol.txt", "r"){ |f| f.read.split }
articol.each { |x| x.downcase! }#le punem într-un array și le rescriem cu litere mici totodata
nr_cuv = articol.count#numărăm câte cuvinte avem în total ca să știm cum să calculăm procentele

#cu metoda inject creăm un hash din array-ul nostru unde cheile sunt cuvintele iar valoarea este numărul de apariții ale acelor cuvinte în articol
hash_cuv = articol.inject(Hash.new(0)) { |k,v| k[v] += 1; k }
#puts hash_cuv

#punem cheile și valorile hash_cuv ordonate după valori în array-ul de array-uri arr2_cuv
arr2_cuv = hash_cuv.sort_by { |k,v| v }.reverse

#acum vom crea un nou fișier unde vom afișa datele
output = File.new("dens17.txt", "w") 
output.puts "Numar total de cuvinte analizate: #{nr_cuv}"
i = 1
arr2_cuv.each { #parcurgem arr2_cuv
	|x|
	x[2] = x[1] * 1.0 * 100 / nr_cuv #aflăm procentul densității, nu înțeleg de ce nu se memorează cu tot cu decimale
	output.puts "#{i}. cuvant: #{x[0]} | nr aparitii #{x[1]} | densitate #{sprintf('%.2f', x[2])}%"
	 i += 1
	 }
output.close
