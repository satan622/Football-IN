----------------------------------------------board------------------------------------------------------------
drop table board;

create table board(
	bno int not null auto_increment,
	title varchar(200) not null,
	content text null,
	writer varchar(50) not null,
	regdate timestamp not null default now(),
	viewcnt int default 0,
	primary key(bno)
)engine=InnoDB;

insert into board(title, content, writer) values('제목입니다','내용입니다','user00');

insert into board(title, content, writer)
(select title, content, writer from board)

select * from board where bno > 0 order by bno desc limit 0,10;
select * from board where bno > 0 order by bno desc limit 10,10;

----------------------------------------------reply------------------------------------------------------------
drop table reply;

create table reply(
	rno int not null auto_increment,
	bno int not null default 0,
	replytext varchar(1000) not null,
	replyer varchar(50) not null,
	regdate Timestamp not null default now(),
    primary key(rno)
);

alter table reply add constraint fk_board
foreign key(bno) references board(bno);

----------------------------------------------count------------------------------------------------------------
alter table board add column replycnt int default 0;

----------------------------------------------user------------------------------------------------------------
drop table user;

create table user(
	uid varchar(20) not null,
	upw varchar(20) not null,
	uname varchar(20) not null,
	location varchar(50) not null,
	regdate timestamp not null default now(),
	primary key(uid)
);

-- test data
insert into user(uid, upw, uname, location) values('user00', 'user00', 'KDB', 'Manchaster');
insert into user(uid, upw, uname, location) values('user01', 'user01', 'Kante', 'London');
insert into user(uid, upw, uname, location) values('user02', 'user02', 'Milner', 'Merseyside');
insert into user(uid, upw, uname, location) values('user03', 'user03', 'Son', 'London');
insert into user(uid, upw, uname, location) values('user10', 'user10', 'Messi', 'Barcelona');

----------------------------------------------team------------------------------------------------------------
drop table team;

create table team(
	tno int not null,
	mid VARCHAR(50) not null,
	teamname VARCHAR(50) not null,
	location varchar(50) not null,
	person INT not null default 0,
	regdate TIMESTAMP not null default now(),
	win int not null default 0,
	draw int not null default 0,
	lose int not null default 0,
	totalgoals int not null default 0,
	goalconceded int not null default 0,
	primary key(tno)
);

alter table team add constraint fk_user
foreign key(mid) references user(uid);