require "test_helper"

class TextileElementTest < ActiveSupport::TestCase
  test "store the example and the block" do
    elem = Textile::Element.new("h1. elias")
    assert_not_nil elem
  end

  test "display the textile of an element inside a tr" do
    elem = Textile::Element.new("h1. elias")
    res = "<tr>
            <td>h1. elias</td>
            <td><h1>elias</h1></td>
           </tr>"
    assert elem.display_textile, res
  end

  test "display parsed element" do
    elem = Textile::Element.new("h1. elias") do |text|
      text.gsub!("elias", "ELIAS")
    end

    res = "<tr>
            <td>h1. elias</td>
            <td><h1>ELIAS</h1></td>
           </tr>"
    assert elem.display_textile, res
  end
end

class TextileGuideTest < ActiveSupport::TestCase
  test "displays wiki textile guide" do
    elem = Textile::Guide.new do
      add("h1. Elias")
    end

    res = "<table>
            <tr>
              <th>PARA OBTENER...</th>
              <th>UTILIZA...</th>
            </tr>
            <tr>
              <td>h1. elias</td>
              <td><h1>ELIAS</h1></td>
            </tr>
           </table>"
    assert_not_nil elem.display, res 
  end
end
