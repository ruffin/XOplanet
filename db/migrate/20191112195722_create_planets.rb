class CreatePlanets < ActiveRecord::Migration[6.0]
  def change
    create_table :planets do |t|
      t.integer :loc_rowid
      t.text :pl_hostname
      t.text :pl_letter
      t.text :pl_name
      t.boolean :pl_controvflag
      t.integer :pl_pnum
      t.decimal :pl_orbper
      t.decimal :pl_orbsmax
      t.decimal :pl_orbeccen
      t.decimal :pl_orbincl
      t.decimal :pl_bmassj
      t.decimal :pl_radj
      t.decimal :pl_dens
      t.integer :pl_nnotes
      t.decimal :st_dist
      t.decimal :gaia_dist
      t.decimal :st_optmag
      t.text :st_optband
      t.text :gaia_gmag
      t.decimal :st_teff
      t.decimal :st_mass
      t.decimal :st_rad
      t.text :rowupdate
      t.decimal :pl_eqt
      t.decimal :pl_masse
      t.decimal :pl_ratdor
      t.decimal :pl_ratror
      t.text :pl_status
      t.integer :pl_mnum
      t.text :pl_publ_date
    end
  end
end
