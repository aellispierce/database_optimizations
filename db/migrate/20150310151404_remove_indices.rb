class RemoveIndices < ActiveRecord::Migration
  def change
    remove_index :assemblies, :name
    remove_index :hits, [:subject_id, :subject_type]
    remove_index :genes, :sequence_id
    remove_index :sequences, :assembly_id
  end
end
