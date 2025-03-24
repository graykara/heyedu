# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 유저 데이터 작성
# 관리자 유저
User.create!(
  email: 'admin@example.com',
  password: '123456',
  password_confirmation: '123456',
  role: 1
)

# 일반 유저
User.create!(
  email: 'user@example.com',
  password: '123456',
  password_confirmation: '123456',
  role: 0
)

# PM 유저
User.create!(
  email: 'pm@example.com',
  password: '123456',
  password_confirmation: '123456',
  role: 2
)

# CP 유저
User.create!(
  email: 'cp@example.com',
  password: '123456',
  password_confirmation: '123456',
  role: 3
)

# 카테고리 작성
CourseCategory.create!(name: '기술교육',  code: 'L01')
CourseCategory.create!(name: '교원연수',  code: 'L02')
CourseCategory.create!(name: '사이버교육', code: 'L03')

CourseCategory.create!(name: '정보통신',  code: 'L0101', parent_id: 1)

CourseCategory.create!(name: '응용 SW 엔지니어링', code: 'L010101', parent_id: 4)
CourseCategory.create!(name: '빅데이터분석', code: 'L010102', parent_id: 4)

CourseCategory.create!(name: '직무연수', code: 'L0201', parent_id: 2)

CourseCategory.create!(name: '학습지도', code: 'L020101', parent_id: 7)
CourseCategory.create!(name: '교과지도', code: 'L020102', parent_id: 7)
CourseCategory.create!(name: '생활지도', code: 'L020103', parent_id: 7)
CourseCategory.create!(name: '진로상담', code: 'L020104', parent_id: 7)
CourseCategory.create!(name: '학급운영', code: 'L020105', parent_id: 7)
CourseCategory.create!(name: 'ICT, SW 교육', code: 'L020106', parent_id: 7)
CourseCategory.create!(name: '어학', code: 'L020107', parent_id: 7)
CourseCategory.create!(name: '교양, 자기계발', code: 'L020108', parent_id: 7)
CourseCategory.create!(name: '자격대비', code: 'L020109', parent_id: 7)

CourseCategory.create!(name: '자율 연수', code: 'L0202', parent_id: 2)

CourseCategory.create!(name: '위탁 연수', code: 'L0203', parent_id: 2)

# 과정 작성
course = Course.new(title: '시니어클래스 건강하고 아름답게 사는 법', code: 'c22062901', path: 'http://211.201.120.187:8081/@시니어클래스/', course_category_id: 9, author_id: 1, pm_id: 3, cp_id: 4, published: true, width: 1280, height: 800)
course.poster.attach(io: File.open('/Users/graykara/tmp/poster/c22062901.png'), filename: 'c22062901.png', content_type: 'image/png')
course.build_course_detail
course.save
course = Course.new(title: '대입진학지도 실전편', code: 'c22062902', path: 'http://211.201.120.187:8081//@대입진학지도/', course_category_id: 9, author_id: 1, pm_id: 3, cp_id: 4, published: true, width: 1280, height: 800)
course.poster.attach(io: File.open('/Users/graykara/tmp/poster/c22062902.png'), filename: 'c22062902.png', content_type: 'image/png')
course.build_course_detail
course.save
course = Course.new(title: '대입진학지도 기본편', code: 'c22062903', path: 'http://211.201.120.187:8081/@대입진학지도_기본편/', course_category_id: 9, author_id: 1, pm_id: 3, cp_id: 4, published: true, width: 1280, height: 800)
course.poster.attach(io: File.open('/Users/graykara/tmp/poster/c22062903.png'), filename: 'c22062903.png', content_type: 'image/png')
course.build_course_detail
course.save
course = Course.new(title: '대입진학지도 통합편', code: 'c22062904', path: 'http://211.201.120.187:8081/@대입진학지도_통합편/', course_category_id: 9, author_id: 1, pm_id: 3, cp_id: 4, published: true, width: 1280, height: 800)
course.poster.attach(io: File.open('/Users/graykara/tmp/poster/c22062904.png'), filename: 'c22062904.png', content_type: 'image/png')
course.build_course_detail
course.save
course = Course.new(title: '류성완의 한국사능력 검정시험', code: 'c22062905', path: 'http://211.201.120.187:8081/@한국사능력검정시험/', course_category_id: 9, author_id: 1, pm_id: 3, cp_id: 4, published: true, width: 1280, height: 800)
course.poster.attach(io: File.open('/Users/graykara/tmp/poster/c22062905.png'), filename: 'c22062905.png', content_type: 'image/png')
course.build_course_detail
course.save
course = Course.new(title: '고교학점제를 부탁해 ', code: 'c22062906', path: 'http://211.201.120.187:8081/@고교학점제를_부탁해/', course_category_id: 9, author_id: 1, pm_id: 3, cp_id: 4, published: true, width: 1280, height: 800)
course.poster.attach(io: File.open('/Users/graykara/tmp/poster/c22062906.png'), filename: 'c22062906.png', content_type: 'image/png')
course.build_course_detail
course.save
course = Course.new(title: 'Power BI를 활용한 데이터 시각화', code: 'c22062907', path: 'http://211.201.120.187:8089/28/', course_category_id: 6, author_id: 1, pm_id: 3, cp_id: 4, published: true, width: 1280, height: 830)
course.poster.attach(io: File.open('/Users/graykara/tmp/poster/c22062907.png'), filename: 'c22062907.png', content_type: 'image/png')
course.build_course_detail
course.save
course = Course.new(title: 'Matlab과 머신러닝', code: 'c22062908', path: 'http://211.201.120.187:8089/31/', course_category_id: 6, author_id: 1, pm_id: 3, cp_id: 4, published: true, width: 1280, height: 830)
course.poster.attach(io: File.open('/Users/graykara/tmp/poster/c22062908.png'), filename: 'c22062908.png', content_type: 'image/png')
course.build_course_detail
course.save
course = Course.new(title: '소방기술자 기술자 양성', code: 'c22062909', path: 'http://211.201.120.187:8099/01_양성/', course_category_id: 3, author_id: 1, pm_id: 3, cp_id: 4, published: true, width: 1040, height: 620)
course.poster.attach(io: File.open('/Users/graykara/tmp/poster/c22062909.png'), filename: 'c22062909.png', content_type: 'image/png')
course.build_course_detail
course.save
course = Course.new(title: '소방기술자 기술자 초/중급', code: 'c22062910', path: 'http://211.201.120.187:8099/02_기술자%20초중급/', course_category_id: 3, author_id: 1, pm_id: 3, cp_id: 4, published: true, width: 1040, height: 620)
course.poster.attach(io: File.open('/Users/graykara/tmp/poster/c22062910.png'), filename: 'c22062910.png', content_type: 'image/png')
course.build_course_detail
course.save
course = Course.new(title: '소방기술자 기술자 고/특급', code: 'c22062911', path: 'http://211.201.120.187:8099/03_기술자%20고특급/', course_category_id: 3, author_id: 1, pm_id: 3, cp_id: 4, published: true, width: 1040, height: 620)
course.poster.attach(io: File.open('/Users/graykara/tmp/poster/c22062911.png'), filename: 'c22062911.png', content_type: 'image/png')
course.build_course_detail
course.save
course = Course.new(title: '소방기술자 감리원 초/중급', code: 'c22062912', path: 'http://211.201.120.187:8099/04_감리원%20초중급/', course_category_id: 3, author_id: 1, pm_id: 3, cp_id: 4, published: true, width: 1040, height: 620)
course.poster.attach(io: File.open('/Users/graykara/tmp/poster/c22062912.png'), filename: 'c22062912.png', content_type: 'image/png')
course.build_course_detail
course.save
course = Course.new(title: '소방기술자 감리원 고/특급', code: 'c22062913', path: 'http://211.201.120.187:8099/05_감리원%20고특급/', course_category_id: 3, author_id: 1, pm_id: 3, cp_id: 4, published: true, width: 1040, height: 620)
course.poster.attach(io: File.open('/Users/graykara/tmp/poster/c22062913.png'), filename: 'c22062913.png', content_type: 'image/png')
course.build_course_detail
course.save
