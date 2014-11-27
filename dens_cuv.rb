# varianta .txt
articol = File.open("articol.txt", "r"){ |f| f.read.split }
articol.each { |cuv| cuv.downcase! }
#print articol

# articol.map! { |cuv| cuv.downcase }
# print articol

nr_cuv = articol.count
# puts nr_cuv

#cu metoda inject creăm un hash din array-ul nostru unde cheile sunt cuvintele iar valoarea este numărul de apariții ale acelor cuvinte în articol
hash_cuv = articol.inject(Hash.new(0)) { |k,v| k[v] += 1; k }
# puts hash_cuv 											# { |k,v| k[v] = k[v] + 1; k }

#punem cheile și valorile hash_cuv ordonate după valori în array-ul de array-uri cuv_ord
cuv_ord = hash_cuv.sort_by { |k,v| v }.reverse
# print cuv_ord

# calculăm densitatea cuvintelor și o stocăm pe poziția a doua a fiecărui array secundar
cuv_ord.each { |x| 	x[2] = x[1] * 100.0 / nr_cuv  }
# print cuv_ord
#############################################################################################################
# facem același lucru și pentru a afla densitatea expresiilor
# ideea de baza e că luăm fiecare două cuvinte și verificăm de câte ori apare
expresii = []
i = 0
while articol[i+1] != nil
	expresii[i] = articol[i] + " " + articol[i+1] 
	i += 1
	end
nr_expresii = expresii.count
# print nr_expresii
# print expresii
hash_expresii = expresii.inject(Hash.new(0)) { |k,v| k[v] += 1; k }
# puts hash_expresii

expresii_ord = hash_expresii.sort_by { |k,v| v }.reverse
# print expresii_ord

# calculăm densitatea expresiilor și o stocăm pe poziția a doua a fiecărui array secundar
expresii_ord.each { |x| 	x[2] = x[1] * 100.0 / nr_cuv  }
# print expresii_ord
#############################################################################################################
# acum punem expresiile ordonate în array-ul cuv_ord pentru a putea să le afișăm împreună

nr_cuv_ord = cuv_ord.count # numărul cuvintelor unice
i = 0
while i < nr_cuv_ord
	cuv_ord[i] << expresii_ord[i][0] # în cadrul array-ului cuv_ord[i] adăugăm elementele din expresii_ord[i]
	cuv_ord[i] << expresii_ord[i][1] # pe pozițiile [3], [4] și [5]
	cuv_ord[i] << expresii_ord[i][2]
	i += 1
end 
# print cuv_ord

##########################################################################################################
# acum vom crea un nou fișier unde vom afișa datele
output = File.new("dens30.txt", "w") 
output.puts "Numar total de cuvinte analizate: #{nr_cuv}"
i = 1
cuv_ord.each do |x| # x este un array in cuv_ord 
	output.puts "#{i}. cuvânt: #{x[0]} \s\s| nr apariții: #{x[1]} \t| densitate: #{x[2]}% \s|| expresie: #{x[3]} \s\s| nr apariții: #{x[4]} \t| densitate: #{x[5]}%"
	 i += 1
end
output.close
print cuv_ord # daca foloseam map! returna doar x[2] ?????

#########################################################################################################

# articol = File.open("articol.txt", "r"){ |f| f.read.split }
# articol.each { |x| x.downcase! }#le punem într-un array și le rescriem cu litere mici totodata
# nr_cuv = articol.count#numărăm câte cuvinte avem în total ca să știm cum să calculăm procentele

# #print articol

# expresii = []
# i = 0
# while articol[i+1] != nil
# 	expresii[i] = articol[i] + " " + articol[i+1] 
# 	i += 1
# 	end
# nr_expresii = expresii.count

# hash_cuv2 = articol2.inject(Hash.new(0)) { |k,v| k[v] += 1; k }

# articol3 = hash_cuv2.sort_by { |k,v| v }.reverse

# output = File.new("Dens_expresii.txt", "w")
# i = 1
# articol3.each do |x|
# 	a = x[1] * 100.0 / articol2.count
# 	output.puts "#{i}. expresie: #{x[0]} | aparitii #{x[1]} | procent #{sprintf('%.2f', a)}%"
# 	i += 1
# end
# output.close

# #print articol3

###########################################################################################################

# # varianta pdf
# require 'pdf-reader'

# articol_arr =[]
# articol = PDF::Reader.new('articol.pdf')
# articol.pages.each do |page|
# 	articol_arr << page.text
# end
# articol_arr[0].split!










