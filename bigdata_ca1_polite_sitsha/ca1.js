
//Question 2 Insert Documents
db.movies.insert({
	title: "Fight Club",
	writer: "Chuck Palahniuk",
	year: 1999,
	actors: [
	"Brad Pitt", 
	"Edward Norton"
	]	
})

function insertMovie(title, writer, year, actors){	
	db.movies.insert({
	title: title,
	writer: writer,
	year: year,
	actors: actors		
	});
}

insertMovie("Pulp Fiction", "Quentin Tarantino", 1999, ["John Travolta","Uma Thurman"])
insertMovie("Inglorious Basterds", "Quentin Tarantino", 2009, ["Brad Pitt","Diane Kruger","Eli Roth"]);

db.movies.insert({
	title: "The Hobbit: An Unexpected Journey",
	writer: "J.R.R. Tolkein",
	year: 2012,
	franchise: "The Hobbit"	
})

db.movies.insert({
	title: "The Hobbit: The Desolation of Smaug",
	writer: "J.R.R. Tolkein ",
	year: 2013,
	franchise: "The Hobbit"	
})

db.movies.insert({
	title: "The Hobbit: The Battle of the Five Armies",
	writer: "J.R.R. Tolkein ",
	year: 2012,
	franchise: "The Hobbit",
	synopsis: "Bilbo and Company are forced to engage in a war against an array of combatants and keep the Lonely Mountain from falling into the hands of a rising darkness."
})

db.movies.insert({
	title: "Pee Wee Herman's Big Adventure"	
})

db.movies.insert({
	title: "Avatar"	
})

db.movies.update({'title':'MongoDB Overview'},{$set:{'title':'New MongoDB Tutorial'}})
db.movies.update( {_id: ObjectId("5bddaa998611d4e4229e0de9")}, {$set: {year:1994}});

// Question 3 Query / Find Documents
db.movies.find().pretty()
db.movies.find({"writer":"Quentin Tarantino"}).pretty()
db.movies.find({"actors":"Brad Pitt"}).pretty()
db.movies.find({"franchise":"The Hobbit"}).pretty()
db.movies.find({"year":{$lt:2000}}).pretty()
db.movies.find(
	{
		$or:[
			{"year":{$lt:2000}}, {"year":{$gt:2010}}
		]
	}
).pretty()

//Question 4 Update Documents
db.movies.find({"title": "The Hobbit: An Unexpected Journey"}).pretty()
db.movies.update({_id: ObjectId("5bddac378611d4e4229e0deb")}, {$set:{synopsis: "A reluctant hobbit, Bilbo Baggins, sets out to the Lonely Mountain with a spirited group of dwarves to reclaim their mountain home - and the gold within it - from the dragon Smaug."}});

db.movies.find({"title":"The Hobbit: The Desolation of Smaug"}).pretty()
db.movies.update({"title":"The Hobbit: The Desolation of Smaug"}, {$set:{synopsis: "The dwarves, along with Bilbo Baggins and Gandalf the Grey, continue their quest to reclaim Erebor, their homeland, from Smaug. Bilbo Baggins is in possession of a mysterious and magical ring."}});

db.movies.find({"title":"Pulp Fiction"}).pretty()
db.movies.update({"title":"Pulp Fiction"},{$push:{actors: "Samuel L. Jackson"}});

//Question 5 Text Search
db.movies.ensureIndex({synopsis:"text"})
db.movies.find({$text:{$search:"Bilbo"}}).pretty()
db.movies.find({$text:{$search:"Gandalf"}}).pretty()
db.movies.find({$text:{$search:"Bilbo -Gandalf"}}).pretty()
db.movies.find({$text:{$search:"dwarves \"hobbit\""}}).pretty()
db.movies.find({$text:{$search:"gold dragon"}}).pretty()

//Question 6 Delete Documents
db.movies.count()
db.movies.remove({"title":"Pee Wee Herman's Big Adventure"})
db.movies.remove({"title":"Avatar"})

//Question 7 Relationships
db.users.insert({
	username: "GoodGuyGreg",
	first_name : "Good Guy",
	last_name : "Greg"	
})

db.users.insert({
	username: "ScumbagSteve",
	full_name : {first: "Scumbag", last: "Steve"}	
})

db.posts.insert({
	username : "GoodGuyGreg",
	title: "Passes out at party",
	body: "Wakes up early and cleans house"	
})


function insertPost(username, title, body){
	db.posts.insert({
		username: username,
		title: title,
		body: body		
	});	
}

insertPost("GoodGuyGreg", "Steals your identity", "Raises your credit score")
insertPost("GoodGuyGreg", "Reports a bug in your code", "Sends you a Pull Request")
insertPost("ScumbagSteve", "Borrows something", "Sells it")
insertPost("ScumbagSteve", "Borrows everything", "The end")
insertPost("ScumbagSteve", "Forks your repo on github", "Sets to private")


db.comments.insert({
	username : "GoodGuyGreg",
	comment: "Hope you got a good deal!",
	post: [{"_id" : ObjectId("5be85acdc92ccab74dd01854")}]	
})

db.comments.insert({
	username : "GoodGuyGreg",
	comment: "What's mine is yours!",
	post: [{"_id" : ObjectId("5be85b13c92ccab74dd01855")}]	
})

db.comments.insert({
	username : "GoodGuyGreg",
	comment: "Don't violate the licensing agreement! ",
	post: [{"_id" : ObjectId("5be85b3ec92ccab74dd01856")}]	
})

db.comments.insert({
	username : "ScumbagSteve",
	comment: "It still isn't clean",
	post: [{"_id" : ObjectId("5be856e2c92ccab74dd01851")}]	
})

db.comments.insert({
	username : "ScumbagSteve",
	comment: "Denied your PR cause I found a hack",
	post: [{"_id" : ObjectId("5be85928c92ccab74dd01853")}]	
})

db.comments.count()

//Question 8 Querying related collections
db.users.find().pretty()
db.posts.find().pretty()
db.posts.find({username: "GoodGuyGreg"}).pretty()
db.posts.find({username: "ScumbagSteve"}).pretty()
db.comments.find().pretty()
db.comments.find({username: "GoodGuyGreg"}).pretty()
db.comments.find({username: "ScumbagSteve"}).pretty()

//find all comments belonging to the post "Reports a bug in your code"
db.comments.find({post: db.posts.findOne({title: "Reports a bug in your code"}) ["_id" : ObjectId("5be85928c92ccab74dd01853"])})

	
db.comments.find({post:"5be85928c92ccab74dd01853"}).pretty()


