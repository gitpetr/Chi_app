# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.first || User.create( email: "qwerty@qwerty.com", password: "qwertyqwerty" )

# Articles
user.articles.create( title: "Почему возможна линеарная фактура?",
                      content: "Голос интуитивно понятен. Алеаторика представляет собой аккорд, благодаря широким мелодическим скачкам. Доминантсептаккорд диссонирует нонаккорд, как и реверансы в сторону ранних \"роллингов\". Нота продолжает хроматический септаккорд, таким образом объектом имитации является число длительностей в каждой из относительно автономных ритмогрупп ведущего голоса. Мономерная остинатная педаль иллюстрирует диссонансный соноропериод, но если бы песен было раз в пять меньше, было бы лучше для всех." )

user.articles.create( title: "Целотоновый форшлаг: предпосылки и развитие",
                      content: "Драм-машина дает звукосниматель, и здесь в качестве модуса конструктивных элементов используется ряд каких-либо единых длительностей. Мономерная остинатная педаль трансформирует неизменный аккорд, что отчасти объясняет такое количество кавер-версий. Пуанта изящно вызывает цикл, таким образом объектом имитации является число длительностей в каждой из относительно автономных ритмогрупп ведущего голоса. Септаккорд начинает дискретный флажолет, о чем подробно говорится в книге М.Друскина \"Ганс Эйслер и рабочее музыкальное движение в Германии\". Арпеджио изящно варьирует винил, таким образом объектом имитации является число длительностей в каждой из относительно автономных ритмогрупп ведущего голоса." )

user.articles.create( title: "Структурный гипнотический рифф: полиряд или лайн-ап?",
                      content: "Септаккорд, согласно традиционным представлениям, изящно представляет собой позиционный цикл, как и реверансы в сторону ранних \"роллингов\". Алеаединица, в первом приближении, заканчивает композиционный микрохроматический интервал, благодаря широким мелодическим скачкам. Синкопа, в первом приближении, монотонно иллюстрирует голос, это понятие создано по аналогии с термином Ю.Н.Холопова \"многозначная тональность\". Хамбакер просветляет автономный гармонический интервал, это и есть одномоментная вертикаль в сверхмногоголосной полифонической ткани." )

user.articles.create( title: "Модальный канал глазами современников",
                      content: "Ретро регрессийно продолжает самодостаточный динамический эллипсис, это понятие создано по аналогии с термином Ю.Н.Холопова \"многозначная тональность\". Райдер mezzo forte продолжает перекрестный хамбакер, но если бы песен было раз в пять меньше, было бы лучше для всех. Поп-индустрия имитирует длительностный мнимотакт, таким образом конструктивное состояние всей музыкальной ткани или какой-либо из составляющих ее субструктур (в том числе: временнoй, гармонической, динамической, тембровой, темповой) возникает как следствие их выстраивания на основе определенного ряда (модуса). Субтехника, так или иначе, имеет изоритмический форшлаг, и здесь мы видим ту самую каноническую секвенцию с разнонаправленным шагом отдельных звеньев. Легато, согласно традиционным представлениям, варьирует контрапункт контрастных фактур, это и есть одномоментная вертикаль в сверхмногоголосной полифонической ткани." )

user.articles.create( title: "Глубокий лайн-ап: предпосылки и развитие",
                      content: "Ощущение мономерности ритмического движения возникает, как правило, в условиях темповой стабильности, тем не менее линеарная фактура многопланово иллюстрирует контрапункт контрастных фактур, что отчасти объясняет такое количество кавер-версий. Внутридискретное арпеджио, так или иначе, представляет собой нечетный фузз, однако сами песни забываются очень быстро. Цикл просветляет хамбакер, потому что современная музыка не запоминается. Алеаединица трансформирует кризис жанра, в таких условиях можно спокойно выпускать пластинки раз в три года." )

user.articles.create( title: "Хроматический полиряд: методология и особенности",
                      content: "Очевидно, что субтехника синхронно имитирует хорус, потому что современная музыка не запоминается. Арпеджио использует самодостаточный гармонический интервал, благодаря употреблению микромотивов (нередко из одного звука, а также двух-трех с паузами). Синкопа представляет собой звукорядный цикл, но если бы песен было раз в пять меньше, было бы лучше для всех. Микрохроматический интервал, следовательно, синхронно варьирует конструктивный лайн-ап, таким образом конструктивное состояние всей музыкальной ткани или какой-либо из составляющих ее субструктур (в том числе: временнoй, гармонической, динамической, тембровой, темповой) возникает как следствие их выстраивания на основе определенного ряда (модуса)." )

# Sermons
user.sermons.create( title:  "Ryan",
                     record:  File.open( File.join(Rails.root, '/spec/fixtures/files/Lauren_Piper_-_Ryan.mp3') ),
                     preacher: "Lauren Piper",
                     recorded_date:  DateTime.now )

user.sermons.create( title: "Dont Lose Your Way",
                     record: File.open( File.join(Rails.root, '/spec/fixtures/files/Olga_Zhilkova_-_Don_t_Lose_Your_Way.mp3') ),
                     preacher: "Olga Zhilkova",
                     recorded_date: DateTime.now )

# Album with photos.
album = user.albums.create( name: "Beatiful pictures", description: "Yes, they are!" )

album.photos.create( image: File.open( File.join( Rails.root, '/spec/fixtures/files/multicolor-threads.jpg' ) ) )
album.photos.create( image: File.open( File.join( Rails.root, '/spec/fixtures/files/Seasonscape.jpg' ) ) )
