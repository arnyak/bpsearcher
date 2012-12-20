fsma_parameters = Hash.new
for future in @version.futures
  if future.fsma_budget_yml && parameters = YAML::load(future.fsma_budget_yml)
    parameters.each do |key, value|
      fsma_parameters[key] = Hash.new unless fsma_parameters.has_key?(key)
      fsma_parameters[key][future.id] = value
    end
  end
end
fsma_keys = fsma_parameters.keys.collect{|key| key.to_s}.sort

xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.Workbook({
  'xmlns'      => "urn:schemas-microsoft-com:office:spreadsheet",
  'xmlns:o'    => "urn:schemas-microsoft-com:office:office",
  'xmlns:x'    => "urn:schemas-microsoft-com:office:excel",
  'xmlns:html' => "http://www.w3.org/TR/REC-html40",
  'xmlns:ss'   => "urn:schemas-microsoft-com:office:spreadsheet"
  }) do

  xml.Worksheet 'ss:Name' => 'BP' do
    xml.Table do

      Deal.column_names.each do |column|
        xml.Row do
          xml.Cell { xml.Data column, 'ss:Type' => 'String' }
          xml.Cell { xml.Data Deal.human_attribute_name(column), 'ss:Type' => 'String' }
          xml.Cell { xml.Data @version.deal[column], 'ss:Type' => 'String' }
        end
      end

    end
  end

  xml.Worksheet 'ss:Name' => Current.human_name.pluralize do
    xml.Table do

      xml.Row do
        Current.column_names.each do |column|
          xml.Cell { xml.Data column, 'ss:Type' => 'String' }
        end
      end

      xml.Row do
        Current.column_names.each do |column|
          xml.Cell { xml.Data Current.human_attribute_name(column), 'ss:Type' => 'String' }
        end
      end

      for current in @version.deal.currents
        xml.Row do
          Current.column_names.each do |column|
            xml.Cell { xml.Data current[column], 'ss:Type' => 'String' }
          end
        end
      end

    end
  end

  xml.Worksheet 'ss:Name' => Version.human_name do
    xml.Table do

      Version.column_names.each do |column|
        xml.Row do
          xml.Cell { xml.Data column, 'ss:Type' => 'String' }
          xml.Cell { xml.Data Version.human_attribute_name(column), 'ss:Type' => 'String' }
          xml.Cell { xml.Data @version[column], 'ss:Type' => 'String' }
        end
      end

    end
  end

  xml.Worksheet 'ss:Name' => Version.human_name.pluralize do
    xml.Table do

      xml.Row do
        Version.column_names.each do |column|
          xml.Cell { xml.Data column, 'ss:Type' => 'String' }
        end
      end

      xml.Row do
        Version.column_names.each do |column|
          xml.Cell { xml.Data Version.human_attribute_name(column), 'ss:Type' => 'String' }
        end
      end

      for version in @version.deal.versions
        xml.Row do
          Version.column_names.each do |column|
            xml.Cell { xml.Data version[column], 'ss:Type' => 'String' }
          end
        end
      end

    end
  end

  xml.Worksheet 'ss:Name' => Future.human_name.pluralize do
    xml.Table do

      xml.Row do
        Future.column_names.each do |column|
          xml.Cell { xml.Data column, 'ss:Type' => 'String' }
        end
        fsma_keys.each do |key|
          xml.Cell { xml.Data key, 'ss:Type' => 'String' }
        end
      end

      xml.Row do
        Future.column_names.each do |column|
          xml.Cell { xml.Data Future.human_attribute_name(column), 'ss:Type' => 'String' }
        end
        fsma_keys.each do |key|
          xml.Cell { xml.Data key, 'ss:Type' => 'String' }
        end
      end

      for future in @version.futures
        xml.Row do
          Future.column_names.each do |column|
            xml.Cell { xml.Data future[column], 'ss:Type' => 'String' }
          end
          fsma_keys.each do |key|
            xml.Cell { xml.Data fsma_parameters[key][future.id], 'ss:Type' => 'String' } if fsma_parameters[key].has_key?(future.id)
          end
        end
      end

    end
  end

end
