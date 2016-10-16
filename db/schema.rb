# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161015500000) do

  create_table "cpu", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "cpu_usage",  limit: 24
    t.string   "server_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "disk", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "disk_usage", limit: 24
    t.string   "server_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "process", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "total_process"
    t.string   "server_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "question",   limit: 65535
    t.text     "answer",     limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end