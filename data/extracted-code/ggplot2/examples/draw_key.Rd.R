library(ggplot2)


### Name: draw_key
### Title: Key glyphs for legends
### Aliases: draw_key draw_key_point draw_key_abline draw_key_rect
###   draw_key_polygon draw_key_blank draw_key_boxplot draw_key_crossbar
###   draw_key_path draw_key_vpath draw_key_dotplot draw_key_pointrange
###   draw_key_smooth draw_key_text draw_key_label draw_key_vline
###   draw_key_timeseries

### ** Examples

p <- ggplot(economics, aes(date, psavert, color = "savings rate"))
# key glyphs can be specified by their name
p + geom_line(key_glyph = "timeseries")

# key glyphs can be specified via their drawing function
p + geom_line(key_glyph = draw_key_rect)



