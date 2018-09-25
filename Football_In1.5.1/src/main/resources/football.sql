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