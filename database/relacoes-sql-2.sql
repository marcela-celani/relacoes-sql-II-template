-- Active: 1696458167504@@127.0.0.1@3306

-- Práticas

CREATE TABLE users (
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    created_at TEXT DEFAULT(DATETIME('now', 'localtime'))
);

INSERT INTO users (id, name, email, password) VALUES
('u001', 'Rodrigo', 'rodrigo@gmail.com', '123456'),
('u002', 'Joao', 'joao@gmail.com', '123456'),
('u003', 'Amanda', 'amanda@gmail.com', '123456');

SELECT * from users;
SELECT * from follows;

CREATE TABLE follows (
    follower_id TEXT NOT NULL,
    followed_id TEXT NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followed_id) REFERENCES users(id)
);

INSERT INTO follows VALUES
('u001', 'u002'),
('u001', 'u003'),
('u002', 'u001');

SELECT A.name AS seguidor, B.name AS seguido -- Selecionando os nomes do seguidor e da pessoa seguida
FROM follows AS f -- Especifica os dados que estao sendo selecionados da tabela 'follows' e chamo de F
FULL JOIN users AS A ON f.follower_id = A.id -- Join entre 'follows' e 'users' usando 'follower_id'
LEFT JOIN users AS B ON f.followed_id = B.id; -- Join à esquerda entre 'follows' e 'users' usando 'followed_id'