require 'sinatra'
require 'sinatra/activerecord'

#Establishes database used in application.  
set :database, "sqlite3:///Hubblefly.db"

get '/hubblefly' do
	erb :"home/index"
end

get '/subjects' do
	@subjects = Subject.all
	erb :"subjects/index"
end

get '/subjects/new' do
	@new_subject = Subject.new
	erb :"subjects/new"
end

post '/subjects' do
	@new_subject = Subject.new(params[:subjects])
	@new_subject.save
	redirect "/subjects"
end

get '/subjects/:id' do
	@deleted_subject = Subject.find(params[:id])
	erb :"subjects/show"
end

delete '/subjects/:id' do
	@deleted_subject = Subject.find(params[:id])
	@deleted_subject.delete
	redirect '/subjects'
end

get '/subjects/:id/edit' do
	@updated_subject = Subject.find(params[:id])
	erb :"subjects/edit"
end

put '/subjects/:id' do
	@updated_subject = Subject.find(params[:id])
	@updated_subject.update_attributes(params[:subjects])
	redirect '/subjects'
end

get '/professors' do
	@professors = Professor.all
	erb :"professors/index"
end

get '/professors/new' do
	@new_professor = Professor.new
	erb :"professors/new"
end

post '/professors' do
	@new_professor = Professor.new(params[:professors])
	@new_professor.save
	redirect '/professors'
end

get '/professors/:id' do
	@delete_professor = Professor.find(params[:id])
	@selected_professor = Professor.find(params[:id])
	erb :"professors/show"
end

delete '/professors/:id' do
	@delete_professor = Professor.find(params[:id])
	@delete_professor.delete
	redirect '/professors'
end

get '/professors/:id/edit' do
	@updated_professor = Professor.find(params[:id])
	erb :"professors/edit"
end

put '/professors/:id' do
	@updated_professor = Professor.find(params[:id])
	@updated_professor.update_attributes(params[:professors])
	redirect "/professors"
end

get '/courses' do
	@courses = Course.all
	erb :"courses/index"
end

get '/courses/new' do
	@new_course = Course.new
	erb :"courses/new"
end

post '/courses' do
	@new_course = Course.new(params[:courses])
	@new_course.save
	redirect '/courses'
end

get '/courses/:id/edit' do
	@updated_course = Course.find(params[:id])
	erb :"courses/edit"
end

put '/courses/:id' do
	@updated_course = Course.find(params[:id])
	@updated_course.update_attributes(params[:courses])
	redirect "/courses"
end

get '/courses/:id' do
	@deleted_course = Course.find(params[:id])
	@selected_course = Course.find(params[:id])
		if @selected_course.professor_id == 1
			@selected_professor = "Dr. Beadles"
		elsif @selected_course.professor_id == 2
			@selected_professor = "Dr. Yang"
		elsif @selected_course.professor_id == 3
			@selected_professor = "Dr. Holland"
		elsif @selected_course.professor_id == 4
			@selected_professor = "Dr. Sams"
		end
	erb :"courses/show"
end

delete '/courses/:id' do
	@deleted_course = Course.find(params[:id])
	@deleted_course.delete 
	redirect '/courses'
end

get '/studies' do
	@studies = Study.all
	erb :"studies/index"
end

post "/studies/:id" do
	@study = Study.new(params[:studies])
	@study.save
	redirect "/studies"
end


class Professor < ActiveRecord::Base
end

class Course < ActiveRecord::Base
end

class Subject < ActiveRecord::Base
end

class Study < ActiveRecord::Base
end