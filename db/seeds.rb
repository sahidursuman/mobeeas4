user = User.create(email: 'admin@example.com', password: '12345678')
user.add_role :admin
user2 = User.create(email: 'candidate@example.com', password: '12345678')
user2.add_role :candidate
OrganisationType.create(name: 'School', description: 'Primary, Middle and High Schools')
OrganisationType.create(name: 'University', description: 'Australian University')
OrganisationType.create(name: 'College', description: 'TAFEs and Private Colleges')
OrganisationType.create(name: 'Non Profit', description: 'A non-profit organisation')
OrganisationType.create(name: 'Corporate', description: 'Any for-profit business')
OrganisationType.create(name: 'Government Agency', description: 'Any government department or agency')
Organisation.create(organisation_type_id: 1, acara_school_id: 40712, name:	'Palm Avenue School', suburb: 'WESTMEAD', postcode: '2145', state:	'NSW', school_type: 'Special')
Organisation.create(organisation_type_id: 1, acara_school_id: 40717, name:	'St James College', suburb: 'REDFERN', postcode: '2016', state:	'NSW', school_type: 'Secondary')
Organisation.create(organisation_type_id: 1, acara_school_id: 40719, name:	'Spinifex State College - Mount Isa - Senior Campus', suburb: 'MOUNT ISA', postcode: '4825', state:	'QLD', school_type: 'Secondary')
Organisation.create(organisation_type_id: 1, acara_school_id: 40720, name:	'Al Sadiq College Inc', suburb: 'YAGOONA', postcode: '2199', state:	'NSW', school_type: 'Combined')
Organisation.create(organisation_type_id: 1, acara_school_id: 40722, name:	'New Generation College', suburb: 'MELBOURNE', postcode: '3000', state:	'VIC', school_type: 'Secondary')
Organisation.create(organisation_type_id: 1, acara_school_id: 40724, name:	'ALESCO Learning Centre', suburb: 'COOKS HILL', postcode: '2300', state:	'NSW', school_type: 'Special')
Organisation.create(organisation_type_id: 1, acara_school_id: 40726, name:	'Sale College', suburb: 'SALE', postcode: '3850', state:	'VIC', school_type: 'Secondary')
Organisation.create(organisation_type_id: 1, acara_school_id: 40727, name:	'Geraldton Senior College', suburb: 'GERALDTON', postcode: '6530', state:	'WA', school_type: 'Secondary')
Organisation.create(organisation_type_id: 1, acara_school_id: 40735, name:	'Royal Far West School', suburb: 'MANLY', postcode: '2095', state:	'NSW', school_type: 'Special')
skill_categories = [ "Languages",
"English",
"Technology",
"Design & Technology",
"Digital Technologies",
"Software Programming",
"Mathematics",
"Secondary",
"Arts",
"Dance",
"Media Arts",
"Music",
"Visual Arts",
"Humanities & Social Sciences",
"Studies of Religion",
"Engineering",
"Digital Media",
"Science" ]
languages = [ "Arabic",
             "Armenian",
             "Chinese",
             "Classical Greek",
             "Classical Hebrew",
             "Croatian",
             "Dutch",
             "Filipino",
             "French",
             "German",
             "Hindi",
             "Hungarian",
             "Indonesian",
             "Italian",
             "Japanese",
             "Khmer",
             "Korean",
             "Latin",
             "Macedonian",
             "Malay",
             "Maltese",
             "Modern Greek",
             "Modern Hebrew",
             "Persian",
             "Polish",
             "Portuguese",
             "Punjabi",
             "Russian",
             "Serbian",
             "Spanish",
             "Swedish",
             "Tamil",
             "Turkish",
             "Ukranian",
             "Vietnamese",
             "Other" ]


english_categories = [ "Essential",
                      "English as an Additional Language",
                      "Extension",
                      "Other"]

technology_categories = ["Design & Technology",
                         "Digital Technologies",
                         "Other"]


design_and_technology_categories =  ["3D Printing"]

digital_technology_categories = [ "Robotics",
                                 "Electronics",
                                 "Software Programming" ]

software_programming_categories = [ "Specific Languages",
                                   "Application Development" ]

mathematics_categories = [ "Primary",
                          "Secondary",
                          "Other" ]

secondary_mathematics_categories = [ "Essential",
                                    "General",
                                    "Mathematical Methods",
                                    "Specialist" ]

arts_categories = [ "Dance",
                   "Drama",
                   "Media Arts",
                   "Music",
                   "Visual Arts",
                   "Other" ]


dance_categories = [ "Specific" ]

media_arts_categories = [ "Specific" ]

music_categories = [ "Specific" ]
visual_arts_categories = [ "Graphic Design",
                          "Photography",
                          "Other"]

studies_of_religion_categories = [ "Specific" ]

humanities_categories = [ "Legal Studies",
                         "Business Studies",
                         "Economics",
                         "Ancient History",
                         "Modern History",
                         "Geography",
                         "Society & Culture",
                         "Studies of Religion",
                         "Civics & Citizenship" ]

engineering_categories = [ "Civil",
                          "Electrical",
                          "Solar",
                          "Mechanical",
                          "Other" ]

digital_media_categories = ["Game Design",
                            "Animation",
                            "Video Editing",
                            "Web Design",
                            "Other"]

science_categories = [ "Biology",
                      "Chemistry",
                      "Earth & Environmental Science",
                      "Physics",
                      "Other" ]

def create_categories(skill_categories)
  skill_categories.each do |skill_category|
    SkillCategory.create!(name: skill_category)
  end
end

def create_subcategories(parent, categories)
  skill_category = SkillCategory.find_by(name: parent)
  categories.each do |category|
    skill_category.skills << Skill.create!(name: category)
    # top.skills << Skill.create!(name: category)
  end
end

create_categories(skill_categories)
create_subcategories("Languages", languages)
create_subcategories("English", english_categories)
create_subcategories("Technology", technology_categories)
create_subcategories("Design & Technology", design_and_technology_categories)
create_subcategories("Digital Technologies", digital_technology_categories)
create_subcategories("Software Programming", software_programming_categories)
create_subcategories("Mathematics", mathematics_categories)
create_subcategories("Secondary", secondary_mathematics_categories)
create_subcategories("Arts", arts_categories)
create_subcategories("Dance", dance_categories)
create_subcategories("Media Arts", media_arts_categories)
create_subcategories("Music", music_categories)
create_subcategories("Visual Arts", visual_arts_categories)
create_subcategories("Humanities & Social Sciences", humanities_categories)
create_subcategories("Studies of Religion", studies_of_religion_categories)
create_subcategories("Engineering", engineering_categories)
create_subcategories("Digital Media", digital_media_categories)
create_subcategories("Science", science_categories)
