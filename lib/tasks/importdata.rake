namespace :importdata do 
 desc "Import csv files into the database" 
 task :importcsv => :environment do
    require 'fastercsv'
    imports = {'bpcentrals' => Bpcentral.new.attribute_names.push(Bpcentral) - ["nbcontracts","nbmachines","created_at", "updated_at"] , 'bpcentralorgs' => Bpcentralorg.new.attribute_names.push(Bpcentralorg) - ["created_at", "updated_at"], 'bpmachines' => Bpmachine.new.attribute_names.push(Bpmachine) - ["created_at", "updated_at"],'bpcontracts' => Bpcontract.new.attribute_names.push(Bpcontract) - ["created_at", "updated_at"]}
    @results = Hash.new
     imports.each do |file, columns|
        @results[file] = import(file, columns)
        puts "#{file} : #{@results[file]}\n"
     end
 end

   def import(file, columns)
       count = 0
       positions = Hash.new
       model = columns.pop
       
       file_to_open= 'data/' + file + '.txt'
       
       if File.exist?(file_to_open)
          first_line = true
          FasterCSV.foreach(file_to_open, {:col_sep => "\t", :quote_char => "~"}) do |row|
          if first_line
             availables = Hash.new
             row.each_index do |index|
                availables [row[index].downcase] = index
              
             end
             
             columns.each do |column|  
                if availables[column]
                    positions[column] = availables[column] 
                else
                  break;   
                end
             end
             first_line = false 
             
           else
   
              if columns.size == positions.size
                 record = model.new
                 positions.each do |key, value|
                   record[key] = row[value] ? row[value].strip : ''
                 end
                count += 1 if record.save
                p model.to_s + '>' + count.to_s
              end 	
           end
        end
         File.rename('data/' + file + '.txt', 'data/' + file + '.' + Time.now.strftime('%Y%m%d%H%M') + '.txt') if count > 0
      end
     count
   end
end
