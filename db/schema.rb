# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_12_195722) do

  create_table "planets", id: false, force: :cascade do |t|
    t.integer "id"
    t.text "pl_hostname"
    t.text "pl_letter"
    t.text "pl_name"
    t.boolean "pl_controvflag"
    t.integer "pl_pnum"
    t.decimal "pl_orbper"
    t.decimal "pl_orbsmax"
    t.decimal "pl_orbeccen"
    t.decimal "pl_orbincl"
    t.decimal "pl_bmassj"
    t.decimal "pl_radj"
    t.decimal "pl_dens"
    t.integer "pl_nnotes"
    t.decimal "st_dist"
    t.decimal "gaia_dist"
    t.decimal "st_optmag"
    t.text "st_optband"
    t.text "gaia_gmag"
    t.decimal "st_teff"
    t.decimal "st_mass"
    t.decimal "st_rad"
    t.text "rowupdate"
    t.decimal "pl_eqt"
    t.decimal "pl_masse"
    t.decimal "pl_ratdor"
    t.decimal "pl_ratror"
    t.text "pl_status"
    t.integer "pl_mnum"
    t.text "pl_publ_date"
  end

end
