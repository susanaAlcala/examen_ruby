def read_alum(file_name)
    file = File.open(file_name, 'r')
    alum = file.readlines.map(&:chomp).map { |lines| lines.split(', ') }
    file.close
    alum
end

def display_name_prom
    arr_aux = {}
    alumnos = read_alum('alumnos.csv')
    alumnos.each do |data|
        cont = 0
        acc = 0
        data.each_with_index do |alumno,index| 
            acc += alumno.to_i if index != 0
            cont += 1
        end
        promedio = acc/(cont-1).to_f
        puts "Alumno: #{data[0]}, Promedio: #{promedio}"
    end
    return arr_aux
end 

def inasist
    alumnos = read_alum('alumnos.csv')
    alumnos.each do |data|
        cont = 0
        data.each_with_index do |alumno,index|
            puts "Alumno: #{data[0]}, inasistencias: #{cont =+ 1}" if alumno.to_i == 0 && index != 0
        end 
    end 
end 
    
def aprobado (nota)
    promedio = 0
    alumnos = read_alum('alumnos.csv')
    alumnos.each do |data|
        cont = 0
        acc = 0
        data.each_with_index do |alumno,index| 
            acc += alumno.to_f if index != 0
            cont += 1
        end
        promedio = acc.to_f/cont
        puts "Alumno aprobado: #{data[0]}" if promedio >= nota
    end
end 

option = 0

while option != 4
    puts "Elige una opción entre 1 y 3, 4 para terminar"
    option = gets.chomp.to_i
    case option
    when 1
       display_name_prom
    when 2
        inasist  
    when 3
        aprobado(5.0)
    when 4
        puts "Saliste del programa"
    else 
        puts "Opción no válida"
        puts "Elige una opción entre 1 y 3, 4 para terminar"
        option = gets.chomp.to_i
    end
end