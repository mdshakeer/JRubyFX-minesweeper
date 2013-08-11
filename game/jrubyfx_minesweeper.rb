#!/usr/bin/env jruby -- Mindsweeper
# Created by Prasanth <@prashanth702> and Shakeer <@mdshakeer>

require "jrubyfx"

class Mindsweeper < JRubyFX::Application

@@ROW_COUNT = 15
@@COL_COUNT = 30
@@BOX = 30
@@PADDING = 5
@@SCENE_WIDTH = ( @@COL_COUNT * ( @@BOX + 1 ) ) + (5.2 * @@PADDING) 
@@SCENE_HEIGHT = ( @@ROW_COUNT * ( @@BOX + 1 ) ) + (9.5 * @@PADDING)

def start(stage)
  with(stage,title:"JRubyFX -Mindsweeper", width:@@SCENE_WIDTH, height:@@SCENE_HEIGHT) do
    layout_scene do
      vbox(padding:@@PADDING) do 
        pane do
          g = grid_pane(hgap:1, vgap:1,alignment:Pos::CENTER) do 
            @@ROW_COUNT.times do |i|
              @@COL_COUNT.times do |j|               
                box = Rectangle.new
                box.width = @@BOX
                box.height = @@BOX
                box.get_style_class.add "box"                 
                box_pane = StackPane.new
                box_pane.get_children.add box
                add  box_pane,j,i
              end
            end 
          end
        end 
        hbox do
        end  
      end 
    end.get_stylesheets.add "style.css"   
    show 
  end
end
end

Mindsweeper.launch