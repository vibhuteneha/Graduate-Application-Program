
    create table additionalinfo (
        id int4 not null,
        field_name varchar(255),
        field_status varchar(255),
        field_type varchar(255),
        field_value varchar(255),
        application_id int4,
        departments_id int4,
        primary key (id)
    );

    create table admin_staff (
        user_id int4 not null,
        role varchar(255)
    );

    create table applications (
        id int4 not null,
        cin varchar(255),
        citizenship varchar(255),
        dob varchar(255),
        email varchar(255),
        first_name varchar(255),
        gender varchar(255),
        gpa varchar(255),
        gre varchar(255),
        last_name varchar(255),
        phone varchar(255),
        status varchar(255),
        submit_date timestamp,
        term varchar(255),
        toefl varchar(255),
        applicant_id int4,
        programs_id int4,
        transcripts_id int8,
        primary key (id)
    );

    create table applicationstatus (
        id int4 not null,
        status_comment varchar(255),
        status_name varchar(255),
        status_time timestamp,
        applications_id int4,
        userid_id int4,
        primary key (id)
    );

    create table degrees (
        id int4 not null,
        degree_earned varchar(255),
        major varchar(255),
        school_name varchar(255),
        time_period varchar(255),
        application_id int4,
        primary key (id)
    );

    create table departments (
        id int4 not null,
        department_name varchar(255),
        primary key (id)
    );

    create table files (
        id int8 not null,
        name varchar(255),
        type varchar(255),
        primary key (id)
    );

    create table programs (
        id int4 not null,
        program_name varchar(255),
        departments_id int4,
        primary key (id)
    );

    create table users (
        id int4 not null,
        email varchar(255) not null,
        first_name varchar(255),
        last_name varchar(255),
        password varchar(255) not null,
        primary key (id)
    );

    alter table users 
        add constraint UK_6dotkott2kjsp8vw4d0m25fb7 unique (email);

    alter table additionalinfo 
        add constraint FK_iryawg4o1bkjghe0666hvtkjl 
        foreign key (application_id) 
        references applications on delete set null;

    alter table additionalinfo 
        add constraint FK_j3m5tvariqvywimp6i1vdqy9p 
        foreign key (departments_id) 
        references departments on delete set null;

    alter table admin_staff 
        add constraint FK_a5npico4yito5lvrc1oblscjo 
        foreign key (user_id) 
        references users on delete set null;

    alter table applications 
        add constraint FK_lmcomkxa52fc4kw1pgin4ov1i 
        foreign key (applicant_id) 
        references users on delete set null;

    alter table applications 
        add constraint FK_kakk1kv9y1iq5oeyfxmk1ij2a 
        foreign key (programs_id) 
        references programs on delete set null;

    alter table applications 
        add constraint FK_t9v73khkp1habrgl3sy8i7510 
        foreign key (transcripts_id) 
        references files on delete set null;

    alter table applicationstatus 
        add constraint FK_deptiedcrttph0edavigqlp7w 
        foreign key (applications_id) 
        references applications on delete set null;

    alter table applicationstatus 
        add constraint FK_6j95mwkk3oww0p5pyfv5jxyhj 
        foreign key (userid_id) 
        references users on delete set null;

    alter table degrees 
        add constraint FK_rqi4wrhhtwwk6r9c9hcjyext9 
        foreign key (application_id) 
        references applications on delete set null;

    alter table programs 
        add constraint FK_6995prie8a46y8rquuqq1rigy 
        foreign key (departments_id) 
        references departments on delete set null;

    create sequence hibernate_sequence minvalue 100;
    
    insert into departments values(6, 'Accounting');
	insert into departments values(7, 'Computer Science');

	insert into programs values(8, 'MS in Accounting', 6);
	insert into programs values(9, 'MS in Computer Science', 7);

	
	insert into users values (1, 'admin@localhost.localdomain', 'admin', 'Brown', 'abcd');
	insert into users values (2, 'staff1@localhost.localdomain', 'staff1', 'Miller', 'abcd');
	insert into users values (3, 'staff2@localhost.localdomain', 'staff2', 'Jones', 'abcd');
	insert into users values (4, 'student1@localhost.localdomain', 'student1', 'Adams', 'abcd');
	insert into users values (5, 'student2@localhost.localdomain', 'student2', 'Smiths', 'abcd');

	insert into applications values (11, '304356789', 'India', '10/12/1992', 'Adams@gmail.com', 'Kelly', 'Female', '3.5', '299', 'Adams', '6263456789', 'New', '09/10/2015', 'Fall 2016', '89', 4, 8);

	insert into additionalinfo values(10, 'GMAT', 'required', 'number', 100, 11, 6);

	insert into applicationstatus values (12, '', 'New', '01/28/2016 16:35:00', 11, 4);

	insert into degrees values(15, 'BCom', 'Accounting', 'Sandip Foundation', '2010-2013',11);
	insert into degrees values(16, 'HSC', 'Commerce', 'BYK', '2008-2010',11);


	
	insert into admin_staff values (1, 'Admin');
	insert into admin_staff values (2, 'Staff');
	insert into admin_staff values (3, 'Staff');
	insert into admin_staff values (4, 'Student');
	insert into admin_staff values (5, 'Student');