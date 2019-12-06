class MovieDataEntity {
	int total;
	int count;
	int start;
	String title;
	List<MovieData> subjects;

	MovieDataEntity({this.total, this.subjects, this.count, this.start, this.title});

	MovieDataEntity.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		count = json['count'];
		start = json['start'];
		title = json['title'];
		if (json['subjects'] != null) {
			subjects = new List<MovieData>();(json['subjects'] as List).forEach((v) { subjects.add(new MovieData.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['total'] = this.total;
		if (this.subjects != null) {
      data['subjects'] =  this.subjects.map((v) => v.toJson()).toList();
    }
		data['count'] = this.count;
		data['start'] = this.start;
		data['title'] = this.title;
		return data;
	}
}

class MovieData {
	ImageUrl images;
	String originalTitle;
	String year;
	List<Director> directors;
	Rating rating;
	String alt;
	String title;
	int collectCount;
	bool hasVideo;
	List<String> pubdates;
	List<Cast> casts;
	String subtype;
	List<String> genres;
	List<String> durations;
	String mainlandPubdate;
	String id;

	MovieData({this.images, this.originalTitle, this.year, this.directors, this.rating, this.alt, this.title, this.collectCount, this.hasVideo, this.pubdates, this.casts, this.subtype, this.genres, this.durations, this.mainlandPubdate, this.id});

	MovieData.fromJson(Map<String, dynamic> json) {
		images = json['images'] != null ? new ImageUrl.fromJson(json['images']) : null;
		originalTitle = json['original_title'];
		year = json['year'];
		if (json['directors'] != null) {
			directors = new List<Director>();(json['directors'] as List).forEach((v) { directors.add(new Director.fromJson(v)); });
		}
		rating = json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
		alt = json['alt'];
		title = json['title'];
		collectCount = json['collect_count'];
		hasVideo = json['has_video'];
		pubdates = json['pubdates']?.cast<String>();
		if (json['casts'] != null) {
			casts = new List<Cast>();(json['casts'] as List).forEach((v) { casts.add(new Cast.fromJson(v)); });
		}
		subtype = json['subtype'];
		genres = json['genres']?.cast<String>();
		durations = json['durations']?.cast<String>();
		mainlandPubdate = json['mainland_pubdate'];
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.images != null) {
      data['images'] = this.images.toJson();
    }
		data['original_title'] = this.originalTitle;
		data['year'] = this.year;
		if (this.directors != null) {
      data['directors'] =  this.directors.map((v) => v.toJson()).toList();
    }
		if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
		data['alt'] = this.alt;
		data['title'] = this.title;
		data['collect_count'] = this.collectCount;
		data['has_video'] = this.hasVideo;
		data['pubdates'] = this.pubdates;
		if (this.casts != null) {
      data['casts'] =  this.casts.map((v) => v.toJson()).toList();
    }
		data['subtype'] = this.subtype;
		data['genres'] = this.genres;
		data['durations'] = this.durations;
		data['mainland_pubdate'] = this.mainlandPubdate;
		data['id'] = this.id;
		return data;
	}
}

class ImageUrl {
	String small;
	String large;
	String medium;

	ImageUrl({this.small, this.large, this.medium});

	ImageUrl.fromJson(Map<String, dynamic> json) {
		small = json['small'];
		large = json['large'];
		medium = json['medium'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['small'] = this.small;
		data['large'] = this.large;
		data['medium'] = this.medium;
		return data;
	}
}

class Director {
	String name;
	String alt;
	String id;
	MovieData2SubjectsDirectorsAvatars avatars;
	String nameEn;

	Director({this.name, this.alt, this.id, this.avatars, this.nameEn});

	Director.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		alt = json['alt'];
		id = json['id'];
		avatars = json['avatars'] != null ? new MovieData2SubjectsDirectorsAvatars.fromJson(json['avatars']) : null;
		nameEn = json['name_en'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['alt'] = this.alt;
		data['id'] = this.id;
		if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
		data['name_en'] = this.nameEn;
		return data;
	}
}

class MovieData2SubjectsDirectorsAvatars {
	String small;
	String large;
	String medium;

	MovieData2SubjectsDirectorsAvatars({this.small, this.large, this.medium});

	MovieData2SubjectsDirectorsAvatars.fromJson(Map<String, dynamic> json) {
		small = json['small'];
		large = json['large'];
		medium = json['medium'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['small'] = this.small;
		data['large'] = this.large;
		data['medium'] = this.medium;
		return data;
	}
}

class Rating {
	double average;
	int min;
	int max;
	String stars;

	Rating({this.average, this.min, this.max, this.stars});

	Rating.fromJson(Map<String, dynamic> json) {
		average = json['average'];
		min = json['min'];
		max = json['max'];
		stars = json['stars'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['average'] = this.average;
		data['min'] = this.min;
		data['max'] = this.max;
		data['stars'] = this.stars;
		return data;
	}
}

class Cast {
	String name;
	String alt;
	String id;
	Avatars avatars;
	String nameEn;

	Cast({this.name, this.alt, this.id, this.avatars, this.nameEn});

	Cast.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		alt = json['alt'];
		id = json['id'];
		avatars = json['avatars'] != null ? new Avatars.fromJson(json['avatars']) : null;
		nameEn = json['name_en'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['alt'] = this.alt;
		data['id'] = this.id;
		if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
		data['name_en'] = this.nameEn;
		return data;
	}
}

class Avatars {
	String small;
	String large;
	String medium;

	Avatars({this.small, this.large, this.medium});

	Avatars.fromJson(Map<String, dynamic> json) {
		small = json['small'];
		large = json['large'];
		medium = json['medium'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['small'] = this.small;
		data['large'] = this.large;
		data['medium'] = this.medium;
		return data;
	}
}
