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

# 카테고리 작성
CourseCategory.create!(id: 1, name: '기술교육',  code: 'L01')
CourseCategory.create!(id: 2, name: '교원연수',  code: 'L02')
CourseCategory.create!(id: 3, name: '사이버교육', code: 'L03')

CourseCategory.create!(id: 4, name: '정보통신',  code: 'L0101', parent_id: 1)

CourseCategory.create!(id: 5, name: '응용 SW 엔지니어링', code: 'L010101', parent_id: 4)
CourseCategory.create!(id: 6, name: '빅데이터분석', code: 'L010102', parent_id: 4)

CourseCategory.create!(id: 7, name: '직무연수', code: 'L0201', parent_id: 2)

CourseCategory.create!(id: 8, name: '학습지도', code: 'L020101', parent_id: 7)
CourseCategory.create!(id: 9, name: '교과지도', code: 'L020102', parent_id: 7)
CourseCategory.create!(id: 10, name: '생활지도', code: 'L020103', parent_id: 7)
CourseCategory.create!(id: 11, name: '진로상담', code: 'L020104', parent_id: 7)
CourseCategory.create!(id: 12, name: '학급운영', code: 'L020105', parent_id: 7)
CourseCategory.create!(id: 13, name: 'ICT, SW 교육', code: 'L020106', parent_id: 7)
CourseCategory.create!(id: 14, name: '어학', code: 'L020107', parent_id: 7)
CourseCategory.create!(id: 15, name: '교양, 자기계발', code: 'L020108', parent_id: 7)
CourseCategory.create!(id: 16, name: '자격대비', code: 'L020109', parent_id: 7)

CourseCategory.create!(id: 17, name: '자율 연수', code: 'L0202', parent_id: 2)

CourseCategory.create!(id: 18, name: '위탁 연수', code: 'L0203', parent_id: 2)
