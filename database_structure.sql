CREATE TABLE Users (
  user_id BIGSERIAL PRIMARY KEY,
  username VARCHAR(30) NOT NULL,
  email VARCHAR(100) NOT NULL UNIQUE,
  password_hash VARCHAR(60) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);
 CREATE TABLE Compositions (
  composition_id BIGSERIAL PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  genre VARCHAR(50) NOT NULL UNIQUE,
  file_format VARCHAR(10) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
 CREATE TABLE Tags (
  tag_id BIGSERIAL PRIMARY KEY,
  tag_name VARCHAR(50) NOT NULL
);
 CREATE TABLE CompositionAuthors (
  composition_id BIGINT,
  user_id BIGINT,

  FOREIGN KEY (composition_id) REFERENCES Compositions(composition_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),

  PRIMARY KEY (composition_id, user_id)
);  CREATE TABLE SupportingMaterials (
  material_id BIGSERIAL PRIMARY KEY,
  composition_id BIGINT,
  material_type VARCHAR(50) NOT NULL,
  file_path VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  
  FOREIGN KEY (material_id) REFERENCES Compositions(composition_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

 CREATE TABLE CompositionTags (
  composition_id BIGINT,
  tag_id BIGINT,

  FOREIGN KEY (composition_id) REFERENCES Compositions(composition_id),
  FOREIGN KEY (tag_id) REFERENCES Tags(tag_id), 
  PRIMARY KEY (composition_id, tag_id)
);
 CREATE TABLE Comments (
  comment_id BIGSERIAL PRIMARY KEY,
  composition_id BIGINT,
  user_id BIGINT,
  parent_comment_id BIGINT,
  comment_text TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),

  FOREIGN KEY (composition_id) REFERENCES Compositions(composition_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (parent_comment_id) REFERENCES Comments(comment_id)
);
