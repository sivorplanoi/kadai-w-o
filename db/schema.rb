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

ActiveRecord::Schema.define(version: 20171113131418) do

  create_table "groupclassifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "classification"
    t.integer  "grouptab_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["grouptab_id"], name: "index_groupclassifications_on_grouptab_id", using: :btree
  end

  create_table "grouplists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.string   "limit"
    t.string   "classification", default: "デフォルト"
    t.integer  "grouptab_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["grouptab_id"], name: "index_grouplists_on_grouptab_id", using: :btree
  end

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_groups_on_user_id", using: :btree
  end

  create_table "grouptabs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "group_id"
    t.string   "active",     default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["group_id"], name: "index_grouptabs_on_group_id", using: :btree
  end

  create_table "id_unique_validates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "initialdisplays", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "initialdisplay_key"
    t.string   "username"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "initialdisplay_id"
  end

  create_table "personalclassifications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "classification"
    t.integer  "personaltab_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["personaltab_id"], name: "index_personalclassifications_on_personaltab_id", using: :btree
  end

  create_table "personallists", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.string   "limit"
    t.integer  "personaltab_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "classification"
    t.index ["personaltab_id"], name: "index_personallists_on_personaltab_id", using: :btree
  end

  create_table "personaltabs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "active",     default: ""
    t.index ["user_id"], name: "index_personaltabs_on_user_id", using: :btree
  end

  create_table "relationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_relationships_on_group_id", using: :btree
    t.index ["user_id", "group_id"], name: "index_relationships_on_user_id_and_group_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_relationships_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "",         null: false
    t.string   "encrypted_password",     default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,          null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "initial_display",        default: "personal"
    t.string   "setting_name",           default: ""
    t.string   "setting_id",             default: ""
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["setting_id"], name: "index_users_on_setting_id", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

  add_foreign_key "groupclassifications", "grouptabs"
  add_foreign_key "grouplists", "grouptabs"
  add_foreign_key "groups", "users"
  add_foreign_key "grouptabs", "groups"
  add_foreign_key "personalclassifications", "personaltabs"
  add_foreign_key "personallists", "personaltabs"
  add_foreign_key "personaltabs", "users"
  add_foreign_key "relationships", "groups"
  add_foreign_key "relationships", "users"
end
