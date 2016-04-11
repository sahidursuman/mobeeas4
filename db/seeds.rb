role1 = Role.create!(name: 'admin')
role2 = Role.create!(name: 'candidate')
role3 = Role.create!(name: 'host')
role4 = Role.create!(name: 'sponsor')

user = User.create!(email: 'admin@mobeeas.com', password: 'KFmiwork$16')
user.add_role :admin
admin = Admin.create!(user_id: user.id, first_name: 'Adriana', last_name: 'Aster', phone: '0299998888', address: '19 Glenmore Road', suburb: 'Paddington', state: 'NSW' , postcode: '2021')

user1 = User.create!(email: 'admin1@mobeeas.com', password: 'KFmiwork$16')
user1.add_role :admin
admin1 = Admin.create!(user_id: user1.id, first_name: 'Ann', last_name: 'Alama', phone: '0299998888', address: '2 Holden Street', suburb: 'Ashfield', state: 'NSW' , postcode: '2031')

user2 = User.create!(email: 'admin2@mobeeas.com', password: 'KFmiwork$16')
user2.add_role :admin
admin2 = Admin.create!(user_id: user2.id, first_name: 'Annette', last_name: 'Ackerman', phone: '0299998888', address: '19 Fifth Avenue', suburb: 'Denistone', state: 'NSW' , postcode: '2114')

user3 = User.create!(email: 'admin3@mobeeas.com', password: 'KFmiwork$16')
user3.add_role :admin
admin3 = Admin.create!(user_id: user3.id, first_name: 'Anita', last_name: 'Anderson', phone: '0299998888', address: '72 Hotham Parade', suburb: 'Artarmon', state: 'NSW' , postcode: '2064')

user4 = User.create!(email: 'bronwyn@mobeeas.com', password: 'KFmiwork$16')
user4.add_role :admin
admin4 = Admin.create!(user_id: user4.id, first_name: 'Bronwyn', last_name: 'Moreton', phone: '0299998888', address: 'PO Box 282', suburb: 'Gordon', state: 'NSW' , postcode: '2072')


# Profile.create(user_id: user2.id, )
OrganisationType.create!(name: 'School', description: 'Primary, Middle and High Schools')
OrganisationType.create!(name: 'University', description: 'Australian University')
OrganisationType.create!(name: 'College', description: 'TAFEs and Private Colleges')
OrganisationType.create!(name: 'Non Profit', description: 'A non-profit organisation')
OrganisationType.create!(name: 'Corporate', description: 'Any for-profit business')
OrganisationType.create!(name: 'Government Agency', description: 'Any government department or agency')

skill_categories = [ "Languages",
"English",
"Technology",
"Design & Technology",
"Digital Technologies",
"Software Programming",
"Mathematics",
"Dance",
"Drama",
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
             "Vietnamese" ]


english_categories = ["Primary",
                      "Primary-English as an Additional Language",
                      "Secondary-Essential",
                      "Secondary-Advanced",
                      "Secondary-English as an Additional Language",
                      "Secondary-Extension 1",
                      "Secondary-Extension 2"]

technology_categories = [ "Wood",
                          "Metal",
                          "Textiles",
                          "Food"]


design_and_technology_categories =  ["3D Printing"]

digital_technology_categories = [ "Robotics",
                                 "Electronics",
                                 "Software Programming" ]

software_programming_categories = [ "Python",
                                    "C/C++",
                                    "Java",
                                    "HTML",
                                    "Scratch",
                                    "Blockly",
                                    "Wyliodrin",
                                    "Arduino",
                                    "Application Development" ]

mathematics_categories = [ "Primary",
                          "Secondary-General",
                          "Secondary-Advanced",
                          "Secondary-Extension 1",
                          "Secondary-Extension 2"]

dance_categories = ["Ballet",
                    "Jazz Ballet",
                    "Modern"]

drama_categories = ["Primary",
                    "Secondary"]

media_arts_categories = [ "Photography",
                          "Video"]

music_categories = ["Piano",
                    "Guitar",
                    "Wind Instruments",
                    "String Instruments"]

visual_arts_categories = [ "Graphic Design",
                          "Photography",
                          "Drawing",
                          "Painting",
                          "Sculpture"]

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
                          "Mechatronics",
                          "Biomedical"]

digital_media_categories = ["Game Design",
                            "Animation",
                            "Video Editing",
                            "Web Design"]

science_categories = [ "Biology",
                      "Chemistry",
                      "Earth & Environmental Science",
                      "Physics",
                      "Marine Studies"]

def create_categories(skill_categories)
  skill_categories.each do |skill_category|
    SkillCategory.create!(name: skill_category)
  end
end

def create_subcategories(parent, categories)
  skill_category = SkillCategory.find_by(name: parent)
  categories.each do |category|
    skill_category.skills << Skill.create!(name: category, approved: true)
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
create_subcategories("Dance", dance_categories)
create_subcategories("Drama", drama_categories)
create_subcategories("Media Arts", media_arts_categories)
create_subcategories("Music", music_categories)
create_subcategories("Visual Arts", visual_arts_categories)
create_subcategories("Humanities & Social Sciences", humanities_categories)
create_subcategories("Studies of Religion", studies_of_religion_categories)
create_subcategories("Engineering", engineering_categories)
create_subcategories("Digital Media", digital_media_categories)
create_subcategories("Science", science_categories)

CandidateType.create!(name: "University Student")
CandidateType.create!(name: "Professional")
CandidateType.create!(name: "Industry Expert")
CandidateType.create!(name: "Academic")

SchoolYear.create!(name: 'Preschool')
SchoolYear.create!(name: 'Kindergarten')
SchoolYear.create!(name: 'Year 1')
SchoolYear.create!(name: 'Year 2')
SchoolYear.create!(name: 'Year 3')
SchoolYear.create!(name: 'Year 4')
SchoolYear.create!(name: 'Year 5')
SchoolYear.create!(name: 'Year 6')
SchoolYear.create!(name: 'Year 7')
SchoolYear.create!(name: 'Year 8')
SchoolYear.create!(name: 'Year 9')
SchoolYear.create!(name: 'Year 10')
SchoolYear.create!(name: 'Year 11')
SchoolYear.create!(name: 'Year 12')
SchoolYear.create!(name: 'Beyond Year 12')

EngagementTokenPack.create!(name: 'One token', price_ex_gst: 70.00, number_of_tokens: 1)
EngagementTokenPack.create!(name: 'Two tokens', price_ex_gst: 120.00, number_of_tokens: 2)
EngagementTokenPack.create!(name: 'Five tokens', price_ex_gst: 280.00, number_of_tokens: 5)

SubscriptionPack.create!(name: 'organisation', price_ex_gst: 200.00)
SubscriptionPack.create!(name: 'independent', price_ex_gst: 80.00)
SubscriptionPack.create!(name: 'candidate', price_ex_gst: 20.00)
