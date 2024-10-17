import 'package:flutter/material.dart';

void main() {
  runApp(MidtermApp());
}

class MidtermApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Midterm Exam',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MovieListScreen(),
    );
  }
}

class MovieListScreen extends StatefulWidget {
  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final List<Movie> movies = [
    Movie(title: 'The Godfather (1972)', genre: 'Crime/Drama', isAdded: false),
    Movie(
        title: 'The Shawshank Redemption (1994)',
        genre: 'Drama',
        isAdded: false),
    Movie(title: 'Inception (2010)', genre: 'Sci-Fi/Thriller', isAdded: false),
    Movie(
        title: 'The Dark Knight (2008)', genre: 'Action/Crime', isAdded: false),
    Movie(
        title: 'Schindler\'s List (1993)',
        genre: 'Historical Drama',
        isAdded: false),
    Movie(title: 'Pulp Fiction (1994)', genre: 'Crime/Drama', isAdded: false),
    Movie(
        title: 'The Lord of the Rings: The Return of the King (2003)',
        genre: 'Fantasy/Adventure',
        isAdded: false),
    Movie(title: 'Forrest Gump (1994)', genre: 'Drama/Romance', isAdded: false),
    Movie(title: 'Parasite (2019)', genre: 'Thriller/Drama', isAdded: false),
    Movie(
        title: 'Star Wars: Episode IV – A New Hope (1977)',
        genre: 'Sci-Fi/Adventure',
        isAdded: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('[YourName]_MidtermExam'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return MovieCard(
                    movie: movies[index],
                    onAdd: () {
                      setState(() {
                        movies[index].isAdded = true;
                      });
                    },
                    onDetails: () {
                      print(
                          'Details: ${movies[index].title} – ${movies[index].genre}');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Movie {
  final String title;
  final String genre;
  bool isAdded;
  Movie({required this.title, required this.genre, required this.isAdded});
}

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onAdd;
  final VoidCallback onDetails;

  const MovieCard({
    Key? key,
    required this.movie,
    required this.onAdd,
    required this.onDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: movie.isAdded ? Colors.green : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        title: Text(movie.title),
        subtitle: Text(movie.genre),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: onDetails,
              child: const Text('Details'),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: onAdd,
              child: Text(movie.isAdded ? 'Added' : 'Add'),
            ),
          ],
        ),
      ),
    );
  }
}
