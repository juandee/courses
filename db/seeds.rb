# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#CURSADA
course = Course.create(year: 2016, title: 'TTPS-Ruby 2016')
#ALUMNOS
pupil_list = [
	['Juan', 'Desiderio', '11714/2' ,'37353181', 'juan@ruby.com'],
	['Pedro', 'Rodriguez', '11814/8' , '37213478', 'pedro@ruby.com'],
	['Maria', 'Doyenart', '11780/3' , '35789514', 'maria@ruby.com'],
	['Rodrigo', 'Lopez', '10754/1' , '37984132', 'rodrigo@ruby.com'],
	['Sofia', 'Moreno', '10704/9' , '36455287', 'sofia@ruby.com'],
	['Martin', 'Mirra', '08754/7' , '38349875', 'martin@ruby.com'],
	['Marcos', 'Sierra', '12755/5' , '36348779', 'marcos@ruby.com'],
	['Esteban', 'Flores', '10762/1' , '34135884', 'esteban@ruby.com'],
	['Lara', 'Orozco', '10654/3' , '34983181', 'lara@ruby.com'],
	['Clara', 'Garcia', '10174/2' , '39462177', 'clara@ruby.com'],
	['Ramiro', 'Dechamps', '10682/7' , '38652181', 'ramiro@ruby.com'],
	['Esther', 'Goris', '11154/6' , '39621224', 'esther@ruby.com'],
	['Santiago', 'Lamas', '11020/1' , '32721224', 'santiago@ruby.com'],
	['Lucas', 'Arts', '13134/8' , '35621218', 'lucas@ruby.com'],
	['Elias', 'Lockhart', '12564/6' , '38654823', 'elias@ruby.com']
]

pupil_list.each do |pupil| 
	course.pupils.create(name: pupil[0], surname: pupil[1], legajo: pupil[2], dni: pupil[3], email: pupil[4])
end

#EXAMENES
exam_list = [
	['2016-05-20', 'Primer parcial', '6'],
	['2016-08-15', 'Segundo parcial', '5'],
	['2016-11-05', 'Tercer parcial', '7'],
	['2016-12-22', 'Trabajo final', '7']
]

exam_list.each do |exam|
	course.exams.create(date: exam[0], title: exam[1], min_grade: exam[2])
end

#NOTAS
course.pupils.each do |p|
	course.exams.each do |e|
		grade = Grade.create(grade: rand(1..10), exam_id: e.id, pupil_id: p.id)
	end
end

#CURSADA
course = Course.create(year: 2017, title: 'TTPS-Ruby 2017')
#ALUMNOS
pupil_list = [
	['Juan', 'Perez', '11714/2' ,'3712004', 'juan@ruby.com'],
	['Pedro', 'Ortega', '11814/8' , '36489512', 'pedro@ruby.com'],
	['Maria', 'Lamarque', '11780/3' , '33456879', 'maria@ruby.com'],
	['Rodrigo', 'Gonzalez', '10754/1' , '35156489', 'rodrigo@ruby.com'],
	['Sofia', 'Hernandez', '10704/9' , '36512648', 'sofia@ruby.com'],
	['Martin', 'Sanchez', '08754/7' , '38421567', 'martin@ruby.com'],
	['Marcos', 'Olmos', '12755/5' , '36661548', 'marcos@ruby.com'],
	['Esteban', 'Rossi', '10762/1' , '34201468', 'esteban@ruby.com'],
	['Lara', 'Estevanez', '10654/3' , '34134669', 'clara@ruby.com'],
	['Ramiro', 'Evans', '10682/7' , '38465887', 'ramiro@ruby.com'],
	['Esther', 'Ambrusso', '11154/6' , '39020166', 'esther@ruby.com'],
	['Santiago', 'Colombo', '11020/1' , '32456222', 'santiago@ruby.com'],
	['Lucas', 'Cook', '13134/8' , '35000458', 'lucas@ruby.com'],
	['Elias', 'Cuenca', '12564/6' , '38644821', 'elias@ruby.com']
]

pupil_list.each do |pupil| 
	course.pupils.create(name: pupil[0], surname: pupil[1], legajo: pupil[2], dni: pupil[3], email: pupil[4])
end

#EXAMENES
exam_list = [
	['2017-05-15', 'Primer parcial', '6'],
	['2017-08-06', 'Segundo parcial', '5'],
	['2017-12-08', 'Trabajo final', '7']
]

exam_list.each do |exam|
	course.exams.create(date: exam[0], title: exam[1], min_grade: exam[2])
end

#NOTAS
course.pupils.each do |p|
	course.exams.each do |e|
		grade = Grade.create(grade: rand(1..10), exam_id: e.id, pupil_id: p.id)
	end
end