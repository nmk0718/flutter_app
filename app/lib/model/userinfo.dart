class userinfo {
	List<User> user;

	userinfo({this.user});

	userinfo.fromJson(Map<String, dynamic> json) {
		if (json['user'] != null) {
			user = new List<User>();
			json['user'].forEach((v) {
				user.add(new User.fromJson(v));
			});
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.user != null) {
			data['user'] = this.user.map((v) => v.toJson()).toList();
		}
		return data;
	}
}

class User {
	String userEmail;
	String userId;
	String userName;
	String userPhone;
	String userPass;

	User(
			{this.userEmail,
				this.userId,
				this.userName,
				this.userPhone,
				this.userPass});

	User.fromJson(Map<String, dynamic> json) {
		userEmail = json['user_email'];
		userId = json['user_id'];
		userName = json['user_name'];
		userPhone = json['user_phone'];
		userPass = json['user_pass'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['user_email'] = this.userEmail;
		data['user_id'] = this.userId;
		data['user_name'] = this.userName;
		data['user_phone'] = this.userPhone;
		data['user_pass'] = this.userPass;
		return data;
	}
}