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
#set page(paper: "a4", margin: (x: 3cm, y: 1.2cm)) //"us-letter"
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
  v(2mm)
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
    columns: (30pt,1fr, auto),
    gutter: 3mm,
    align(left)[
    #image("4.jpg", width: 250%)],

    align(right)[
      #for key in info_dict.keys() {
        sc(key); linebreak()
      }
    ] ,

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

// Full Name Title Function


// ==================================================
// Begin Document
// ==================================================

#title(
  first_name: "Antonio Nicolae",   // this will be Sentence Case, none to omit
  last_name: "Stan",  // this will be SmallCaps, none to omit
)



//image("4.jpg", width: 20%)

= Dati Personali

#info(
  info_dict: (
    "Nazionalità:": "Italiana" ,
     "Data di nascita:": "January 29, 2000" ,
    "Indirizzo:"                : "Padova, Italy", 
    "Telefono:"                  : link("tel:+39 (IT) 349 7277038"),
    "Email:"                  : link("mailto:stanantonionicolae@gmail.com"),
    "Presentazione:"   :"Hi! I am a recent honors college graduate in Computer Science with a ",
    " ": "strong academic background and a passion for technology. ",
    "    ": "I am currently searching for an entry-level position as a junior",  "     ": "developer in order to gain experience in various fields.", 
       "  ": "To be fairly honest, just a nerd trying to learn new things and ",
    "   ": "make his way into the world.",

  )
)

= Esperienze lavorative


#work(
  date_range: list(marker: [],
    [Luglio 2023],   // start date
    [#to()],      // comment this for single date
    [Settembre 2023],   // end date - comment this for single date
  ),
  position: "Stage Junior Software Developer",
  org: "Sync Lab S.r.l.  ",
  addr: "Padova",
  desc: list(
    [Sviluppo Back-end con Java Spring.],
    [Sviluppo Front-end con Angular.],
    [Gestione di database relazionali con PostgreSQL e Jpa Data.],
    [Implementazione di operazioni CRUD per la manipolazione dei dati.],
    [Utilizzo di metodi HTTP tramite Postman.],
    [Integrazione API REST.]

  ),
)

#work(
  date_range: list(marker: [],
    [Novembre 2021],   // start date
    [#to()],      // comment this for single date
    [Giugno 2022],   // end date - comment this for single date
  ),
  position: "Tecnico informatico",
  org: "Ambulatorio San Massimo",
  addr: "Padova",
  desc: list(
    [Gestione di macchine virtuali su Linux.],
    [Configurazione dei computer lavorativi.],
    [Assistenza agli impiegati lavorativi con problemi tecnici.],
    [Risoluzioni di crash del sistema.],
  ),
)

= Educazione

#edu(
  degree: "Laurea triennale in Scienze Informatiche",
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
= Progetti

#project(
  date_range: list(marker: [],
    [dec 2020],   // start date
    [#to()],      // comment this for single date
    [march 2021],   // end date - comment this for single date
  ),
  title: "Cinema Site",
  org: "Progetto universitario",
  addr: "Web Development",
  desc: list(
    [Sviluppo con Php ],
    [HTML & CSS ],
    [Database relazionali con MySQL.],
  ),
)

#project(
  date_range: list(marker: [],
    [oct 2022],   // start date
    [#to()],      // comment this for single date
    [jun 2023],   // end date - comment this for single date
  ),
  title: "SmartLog Viewer/Statistics",
  org: "Progetto universitario",
  addr: "Software Engineer",
  desc: list(
    [Sviluppo con React.],
    [Documentazione & design pattern structure.],
    [Docker.],

  ),
)


= Competenze informatiche

#skill(
  skill_dict: (
    "Strumenti:"  : "Eclipse, WebStorm, Visual Studio, Git, PgAdming, Postman",
    "Sviluppo:"  : "Php, Java, C++, Python, Javascipt, HTML, CSS , PostgreSQL , MySQL",
    "Frameworks:" : "Spring, Angular ",
     "OS:" : "Linux , Windows "
  )
)

= Competenze linguistiche

#skill(
  skill_dict: (
    "Italian:"  : "Madrelingua",
    "Romanian:"  : "Madrelingua",
    "English:"      : "C1", 
  )
)


// ==================================================
// End Document
// ==================================================

// ==================================================

