// ==================================================
// 
// Typst Resume/CV Template
//
// 
// Inspired by Alessandro Plasmati's Graduate CV LaTex template
// 
// MIT License
// 
// Requires:
// - Typst CLI (https://github.com/typst/typst/)
// - Fontin Fonts (http://www.exljbris.com/fontin.html)
// - Typst-Tablex (https://github.com/PgBiel/typst-tablex)
// 
// ==================================================



// ==================================================
// Config
// ==================================================

// tablex Library for Customizing Vertical Lines in Table

#import "./typst-tablex/tablex.typ": tablex, vlinex, rowspanx

// Page and Text Setup
#set page(paper: "a4", margin: (x: 3cm, y: 2cm)) //"us-letter"
#set text(font: "Fontin", size: 10pt)
#set par(justify: false, leading: 0.45em)

// SmallCaps Function for Fontin Fonts
#let sc(body) = {
  set text(font: "Fontin SmallCaps")
  [#body]
}

// Full Name Title Function
#let title(first_name: none, last_name: none) = {
  set align(center)
  set text(font: "Fontin", size: 24pt)
  [#first_name]
  h(2.5mm)
  set text(font: "Fontin SmallCaps", size: 24pt)
  [#last_name]
  v(7.5mm)
}

// Setting Heading as Section Titles
#show heading: myhead => [
  #v(-1.25mm)
  #set text(font: "Fontin SmallCaps", weight: "regular")
  #myhead
  #v(-4.5mm)
  #set line(length: 100%, stroke: 0.2mm)
  #line()
  #v(-1mm)
]

#let info(info_dict: none) = {
  grid(
    columns: (30%, auto),
    gutter: 3mm,
    align(right)[
      #for key in info_dict.keys() {
        sc(key); linebreak()
      }
    ],
    align(left)[
      #for value in info_dict.values() {
        value; linebreak()
      }
    ],
  )
}

#let work(
  date_range: none,
  position: none,
  org: none,
  addr: none,
  desc: none,
  ) = {
    tablex(
      columns: (15%, auto),
      align: (right, left),
      row-gutter: -1.75mm,
      auto-lines: false,
      stroke: 0.2mm,
      (), vlinex(expand:-1.25mm),
      rowspanx(5)[#sc([#date_range])], [#position],
      (), [#emph(org)],
      (), [#addr],
      (), (v(-1.25mm)),
      (), [#text(size: 9pt, desc)],
    )
}

#let to() = {
  set text(font: "Fontin", size: 8pt)
  align(center)[to]
}

#let skill(skill_dict: none) = {
  grid(
    columns: (25%, auto),
    gutter: 3mm,
    align(right)[
      #for key in skill_dict.keys() {
        sc(key); linebreak()
      }
    ],
    align(left)[
      #for value in skill_dict.values() {
        value; linebreak()
      }
    ],
  )
}

#let edu(date_range: none, degree: none, grade: none, uni: none, addr: none) = {
  tablex(
    columns: (15%, auto),
    align: (right, left),
    row-gutter: -1.75mm,
    auto-lines: false,
    stroke: 0.2mm,
    // (), vlinex(expand:-3pt),
    rowspanx(3)[#sc([#date_range])], [#degree #h(2mm)|#h(2mm) #grade],
    (), [#uni],
    (), [#addr],
  )
  v(-1.5mm)
}

#let project(
  date_range: none,
  title: none,
  org: none,
  addr: none,
  desc: none,
  ) = {
    tablex(
      columns: (15%, auto),
      align: (right, left),
      row-gutter: -1.75mm,
      auto-lines: false,
      stroke: 0.2mm,
      (), vlinex(expand:-1.25mm),
      rowspanx(5)[#sc([#date_range])], [#title],
      (), [#emph(org)],
      (), [#addr],
      (), (v(-1.25mm)),
      (), [#text(size: 9pt, desc)],
    )
}



// ==================================================
// Begin Document
// ==================================================

#title(
  first_name: "Antonio Nicolae",   // this will be Sentence Case, none to omit
  last_name: "Stan",  // this will be SmallCaps, none to omit
)

= Personal Data

#info(
  info_dict: (
    "Place and Date of Birth:": "Romania – January 29, 2000",
    "Address:"                : "Padova, Italy", 
    "Phone:"                  : link("tel:+39 (IT) 349 7277038"),
    "Email:"                  : link("mailto:stanantonionicolae@gmail.com"),
  )
)

= Work Experience


#work(
  date_range: list(marker: [],
    [November 2021],   // start date
    [#to()],      // comment this for single date
    [June 2022],   // end date - comment this for single date
  ),
  position: "System manager",
  org: "Ambulatorio San Massimo (Hospital)",
  addr: "Padova",
  desc: list(
    [Managing Virtual Machines on Linux.],
    [Taking care of working computers.],
    [Assisting company employees with tecnology.],
    [Resolving unexpected system fall downs.],
  ),
)

#work(
  date_range: list(marker: [],
    [July 2023],   // start date
    [#to()],      // comment this for single date
    [September 2023],   // end date - comment this for single date
  ),
  position: "Junior Software Developer Internship",
  org: "Sync Lab S.r.l.  ",
  addr: "Padova",
  desc: list(
    [Back-end development with Java Spring.],
    [Front-end development with Angular.],
    [Managing relational database with PostgreSQL and Jpa Data.],
    [Implementing CRUD operation to manipulate data.],
    [Using HTTP methods through Postman.],
    [API REST integration.]

  ),
)


= Digital Skills

#skill(
  skill_dict: (
    "Tools:"  : "Eclipse, WebStorm, Visual Studio, Git, PgAdming, Postman",
    "Development:"  : "Php, Java, C++, Python, Javascipt, HTML, CSS , PostgreSQL , MySQL",
    "Frameworks:" : "Spring, Angular ",
     "OS:" : "Linux , Windows "
  )
)

= Language Skills

#skill(
  skill_dict: (
    "Italian:"  : "Native",
    "Romanian:"  : "Native",
    "English:"      : "C1", 
  )
)

= Education

#edu(
  degree: "Bachelor degree in Computer Science",
  // grade: "99%",
  uni: "Università degli Studi di Padova",
  addr: "Padova, Italy",
  date_range: list(marker: [],
    [Oct 2019],   // start date
     [#to()],      // uncomment this for date range
     [Sept 2023],   // end date - uncomment this for date range
  ),
)
/*
#edu(
  degree: "Master of Science in Physics",
  grade: "GPA 3.9/4.0",
  uni: "University of Lorem Ipsum",
  addr: "Dolor, Sit Amet",
  date_range: list(marker: [],
    [1900],   // start date
    [#to()],      // uncomment this for date range
    [1890],   // end date - uncomment this for date range
  ),
)
*/
= Projects

#project(
  date_range: list(marker: [],
    [dec 2020],   // start date
    [#to()],      // comment this for single date
    [march 2021],   // end date - comment this for single date
  ),
  title: "Cinema Site",
  org: "College project",
  addr: "Web Development",
  desc: list(
    [Php development],
    [HTML & CSS ],
    [Relational databases with MySQL.],
  ),
)

#project(
  date_range: list(marker: [],
    [oct 2022],   // start date
    [#to()],      // comment this for single date
    [jun 2023],   // end date - comment this for single date
  ),
  title: "SmartLog Viewer/Statistics",
  org: "College project",
  addr: "Software Engineer",
  desc: list(
    [React development.],
    [Documentation writing & design pattern structure.],
    [Docker.],

  ),
)

// ==================================================
// End Document
// ==================================================

// ==================================================

