create table movie_reviews
(
    id           int auto_increment,
    movie_name   varchar(200) not null,
    movie_review text         not null,
    constraint movie_reviews_id_uindex
        unique (id)
)
    comment 'This contains the movie name and the movie review as a row.';

alter table movie_reviews
    add primary key (id);


