// Copyright (c) 2022 XXIV
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
const std = @import("std");

extern "C" fn emojicons_emoji_formatter(str: [*c]const u8) [*c]u8;

extern "C" fn emojicons_free(ptr: [*c] u8) void;

/// Available notations:
///
/// :hocho:
/// :clock730:
/// :arrow_up_small:
/// :scorpius:
/// :rabbit2:
/// :left_right_arrow:
/// :stuck_out_tongue_closed_eyes:
/// :taurus:
/// :cancer:
/// :shell:
/// :coffee:
/// :anchor:
/// :sunny:
/// :musical_keyboard:
/// :white_medium_square:
/// :point_down:
/// :mushroom:
/// :fuelpump:
/// :tangerine:
/// :memo:
/// :smiley:
/// :family:
/// :clock11:
/// :white_check_mark:
/// :scissors:
/// :grimacing:
/// :baby:
/// :walking:
/// :8ball:
/// :worried:
/// :fist:
/// :accept:
/// :fire_engine:
/// :chocolate_bar:
/// :u6e80:
/// :arrow_lower_right:
/// :wolf:
/// :deciduous_tree:
/// :ab:
/// :cherries:
/// :new:
/// :tongue:
/// :broken_heart:
/// :date:
/// :speech_balloon:
/// :ear:
/// :white_medium_small_square:
/// :space_invader:
/// :violin:
/// :traffic_light:
/// :pound:
/// :1234:
/// :city_sunrise:
/// :sandal:
/// :black_small_square:
/// :arrow_heading_down:
/// :pensive:
/// :kissing_cat:
/// :factory:
/// :couple:
/// :thumbsup:
/// :sob:
/// :two_women_holding_hands:
/// :tomato:
/// :fire:
/// :corn:
/// :libra:
/// :bangbang:
/// :baby_bottle:
/// :fast_forward:
/// :rewind:
/// :cactus:
/// :closed_lock_with_key:
/// :bulb:
/// :e-mail:
/// :hamburger:
/// :potable_water:
/// :parking:
/// :lips:
/// :station:
/// :church:
/// :beetle:
/// :rage:
/// :smile:
/// :paperclip:
/// :notebook_with_decorative_cover:
/// :clock830:
/// :bookmark_tabs:
/// :moyai:
/// :necktie:
/// :stuck_out_tongue:
/// :disappointed:
/// :cupid:
/// :womans_hat:
/// :droplet:
/// :sparkling_heart:
/// :round_pushpin:
/// :dancers:
/// :sunflower:
/// :triangular_ruler:
/// :egg:
/// :fork_and_knife:
/// :mans_shoe:
/// :heart_decoration:
/// :100:
/// :recycle:
/// :calendar:
/// :first_quarter_moon_with_face:
/// :bear:
/// :snowflake:
/// :rugby_football:
/// :clock630:
/// :free:
/// :pear:
/// :astonished:
/// :paw_prints:
/// :love_hotel:
/// :wrench:
/// :izakaya_lantern:
/// :congratulations:
/// :girl:
/// :microphone:
/// :o:
/// :oncoming_taxi:
/// :gift:
/// :mouse:
/// :bicyclist:
/// :do_not_litter:
/// :stew:
/// :lock:
/// :diamond_shape_with_a_dot_inside:
/// :sushi:
/// :ng:
/// :telescope:
/// :u6709:
/// :frowning:
/// :goat:
/// :closed_umbrella:
/// :foggy:
/// :arrow_down_small:
/// :cinema:
/// :star:
/// :custard:
/// :rose:
/// :crown:
/// :sparkle:
/// :end:
/// :flipper:
/// :eyes:
/// :sunrise_over_mountains:
/// :mount_fuji:
/// :no_good:
/// :train:
/// :apple:
/// :jeans:
/// :crying_cat_face:
/// :curly_loop:
/// :arrows_clockwise:
/// :running_shirt_with_sash:
/// :disappointed_relieved:
/// :black_nib:
/// :japanese_goblin:
/// :heavy_plus_sign:
/// :copyright:
/// :vibration_mode:
/// :tm:
/// :cop:
/// :white_small_square:
/// :flushed:
/// :clock9:
/// :speedboat:
/// :candy:
/// :heavy_multiplication_x:
/// :dollar:
/// :gem:
/// :roller_coaster:
/// :rocket:
/// :sweet_potato:
/// :mountain_cableway:
/// :hearts:
/// :game_die:
/// :u6307:
/// :helicopter:
/// :thumbsdown:
/// :secret:
/// :tokyo_tower:
/// :+1:
/// :maple_leaf:
/// :pencil2:
/// :department_store:
/// :construction_worker:
/// :arrow_right:
/// :speaker:
/// :a:
/// :clock1230:
/// :honey_pot:
/// :construction:
/// :running:
/// :mask:
/// :eight_spoked_asterisk:
/// :ok_woman:
/// :dress:
/// :clock4:
/// :grey_question:
/// :no_mouth:
/// :satisfied:
/// :clock1030:
/// :blush:
/// :mobile_phone_off:
/// :bento:
/// :scroll:
/// :smile_cat:
/// :ticket:
/// :customs:
/// :basketball:
/// :house:
/// :dolphin:
/// :musical_note:
/// :older_woman:
/// :busstop:
/// :point_right:
/// :angel:
/// :grapes:
/// :baby_chick:
/// :fireworks:
/// :circus_tent:
/// :scream:
/// :moon:
/// :bride_with_veil:
/// :pisces:
/// :sa:
/// :loudspeaker:
/// :no_bicycles:
/// :arrow_left:
/// :heart_eyes:
/// :unamused:
/// :surfer:
/// :repeat_one:
/// :whale:
/// :underage:
/// :smirk_cat:
/// :white_flower:
/// :link:
/// :iphone:
/// :honeybee:
/// :ok:
/// :clock2:
/// :frog:
/// :articulated_lorry:
/// :balloon:
/// :tired_face:
/// :birthday:
/// :hourglass:
/// :monorail:
/// :horse_racing:
/// :haircut:
/// :confused:
/// :yellow_heart:
/// :kissing:
/// :alarm_clock:
/// :hushed:
/// :mute:
/// :boat:
/// :leaves:
/// :icecream:
/// :man:
/// :koko:
/// :crocodile:
/// :whale2:
/// :registered:
/// :cherry_blossom:
/// :u7981:
/// :ocean:
/// :sleepy:
/// :postbox:
/// :incoming_envelope:
/// :shaved_ice:
/// :car:
/// :vs:
/// :closed_book:
/// :clock10:
/// :curry:
/// :massage:
/// :convenience_store:
/// :information_source:
/// :oden:
/// :arrow_down:
/// :waning_crescent_moon:
/// :cd:
/// :no_entry_sign:
/// :credit_card:
/// :bookmark:
/// :womans_clothes:
/// :telephone:
/// :new_moon:
/// :runner:
/// :bust_in_silhouette:
/// :wind_chime:
/// :arrow_heading_up:
/// :see_no_evil:
/// :arrow_double_up:
/// :pizza:
/// :dolls:
/// :sheep:
/// :raised_hand:
/// :raised_hands:
/// :pouting_cat:
/// :mouse2:
/// :elephant:
/// :nut_and_bolt:
/// :headphones:
/// :ring:
/// :ramen:
/// :water_buffalo:
/// :page_with_curl:
/// :poultry_leg:
/// :heartpulse:
/// :dromedary_camel:
/// :european_post_office:
/// :train2:
/// :bullettrain_side:
/// :pig_nose:
/// :clapper:
/// :page_facing_up:
/// :airplane:
/// :ghost:
/// :mailbox_closed:
/// :point_up_2:
/// :barber:
/// :sweat_drops:
/// :peach:
/// :palm_tree:
/// :turtle:
/// :mountain_bicyclist:
/// :trophy:
/// :wheelchair:
/// :anguished:
/// :money_with_wings:
/// :put_litter_in_its_place:
/// :sweat:
/// :aerial_tramway:
/// :ok_hand:
/// :open_file_folder:
/// :dart:
/// :hand:
/// :clipboard:
/// :key:
/// :arrow_right_hook:
/// :sos:
/// :person_frowning:
/// :mag_right:
/// :hotel:
/// :battery:
/// :crystal_ball:
/// :raising_hand:
/// :seedling:
/// :wavy_dash:
/// :dvd:
/// :cold_sweat:
/// :woman:
/// :clock130:
/// :sailboat:
/// :small_red_triangle_down:
/// :outbox_tray:
/// :sweat_smile:
/// :earth_africa:
/// :evergreen_tree:
/// :toilet:
/// :racehorse:
/// :volcano:
/// :womens:
/// :eight_pointed_black_star:
/// :footprints:
/// :wink:
/// :top:
/// :clock230:
/// :performing_arts:
/// :u7a7a:
/// :golf:
/// :rowboat:
/// :black_circle:
/// :up:
/// :ship:
/// :high_brightness:
/// :repeat:
/// :full_moon:
/// :muscle:
/// :zzz:
/// :large_blue_diamond:
/// :stuck_out_tongue_winking_eye:
/// :couple_with_heart:
/// :twisted_rightwards_arrows:
/// :minibus:
/// :black_joker:
/// :baggage_claim:
/// :joy:
/// :persevere:
/// :on:
/// :poodle:
/// :envelope:
/// :speak_no_evil:
/// :ideograph_advantage:
/// :ice_cream:
/// :couplekiss:
/// :sun_with_face:
/// :rice_cracker:
/// :pray:
/// :japan:
/// :dizzy_face:
/// :boar:
/// :last_quarter_moon_with_face:
/// :question:
/// :bouquet:
/// :smiling_imp:
/// :wave:
/// :sake:
/// :trolleybus:
/// :anger:
/// :panda_face:
/// :floppy_disk:
/// :koala:
/// :person_with_pouting_face:
/// :snake:
/// :pouch:
/// :gift_heart:
/// :non-potable_water:
/// :grin:
/// :cat:
/// :mahjong:
/// :yum:
/// :x:
/// :no_mobile_phones:
/// :dragon_face:
/// :vertical_traffic_light:
/// :doughnut:
/// :arrow_lower_left:
/// :b:
/// :capital_abcd:
/// :arrows_counterclockwise:
/// :pushpin:
/// :grey_exclamation:
/// :jack_o_lantern:
/// :tropical_drink:
/// :saxophone:
/// :heavy_dollar_sign:
/// :tractor:
/// :rabbit:
/// :open_hands:
/// :earth_americas:
/// :mailbox_with_no_mail:
/// :mens:
/// :dragon:
/// :suspension_railway:
/// :exclamation:
/// :heavy_division_sign:
/// :high_heel:
/// :statue_of_liberty:
/// :post_office:
/// :no_entry:
/// :video_camera:
/// :u5408:
/// :wedding:
/// :school_satchel:
/// :sagittarius:
/// :facepunch:
/// :pager:
/// :no_smoking:
/// :dog:
/// :aquarius:
/// :books:
/// :beers:
/// :cocktail:
/// :older_man:
/// :guitar:
/// :skull:
/// :railway_car:
/// :point_left:
/// :black_medium_square:
/// :fishing_pole_and_fish:
/// :six_pointed_star:
/// :expressionless:
/// :oncoming_bus:
/// :euro:
/// :flower_playing_cards:
/// :school:
/// :rice_ball:
/// :restroom:
/// :nose:
/// :snowboarder:
/// :large_orange_diamond:
/// :rice_scene:
/// :umbrella:
/// :sparkles:
/// :microscope:
/// :chart:
/// :-1:
/// :clock3:
/// :shirt:
/// :blue_book:
/// :office:
/// :herb:
/// :slot_machine:
/// :trumpet:
/// :radio:
/// :chestnut:
/// :arrow_double_down:
/// :bikini:
/// :small_blue_diamond:
/// :sunrise:
/// :lemon:
/// :clock8:
/// :eyeglasses:
/// :globe_with_meridians:
/// :chicken:
/// :partly_sunny:
/// :cl:
/// :banana:
/// :leo:
/// :spaghetti:
/// :clock1130:
/// :punch:
/// :japanese_castle:
/// :cat2:
/// :star2:
/// :hourglass_flowing_sand:
/// :boy:
/// :bird:
/// :orange_book:
/// :tulip:
/// :man_with_turban:
/// :ophiuchus:
/// :lollipop:
/// :waxing_gibbous_moon:
/// :heartbeat:
/// :email:
/// :swimmer:
/// :ox:
/// :tram:
/// :revolving_hearts:
/// :blowfish:
/// :information_desk_person:
/// :green_apple:
/// :cake:
/// :cloud:
/// :unlock:
/// :virgo:
/// :abcd:
/// :video_game:
/// :u7533:
/// :snail:
/// :bridge_at_night:
/// :bell:
/// :cool:
/// :ballot_box_with_check:
/// :clock7:
/// :imp:
/// :guardsman:
/// :confetti_ball:
/// :clap:
/// :carousel_horse:
/// :metro:
/// :bread:
/// :melon:
/// :smirk:
/// :bathtub:
/// :large_blue_circle:
/// :truck:
/// :angry:
/// :notes:
/// :christmas_tree:
/// :dizzy:
/// :blossom:
/// :crossed_flags:
/// :cyclone:
/// :notebook:
/// :v:
/// :low_brightness:
/// :cow2:
/// :camel:
/// :cookie:
/// :pineapple:
/// :tophat:
/// :briefcase:
/// :chart_with_downwards_trend:
/// :bullettrain_front:
/// :yen:
/// :checkered_flag:
/// :dog2:
/// :interrobang:
/// :ear_of_rice:
/// :relaxed:
/// :minidisc:
/// :ant:
/// :mailbox:
/// :rooster:
/// :relieved:
/// :seat:
/// :kissing_heart:
/// :love_letter:
/// :heart:
/// :open_mouth:
/// :santa:
/// :tent:
/// :zap:
/// :joy_cat:
/// :innocent:
/// :hospital:
/// :hankey:
/// :fries:
/// :wine_glass:
/// :arrow_backward:
/// :watch:
/// :handbag:
/// :cow:
/// :children_crossing:
/// :hatched_chick:
/// :leftwards_arrow_with_hook:
/// :monkey_face:
/// :lock_with_ink_pen:
/// :purple_heart:
/// :diamonds:
/// :ski:
/// :red_circle:
/// :part_alternation_mark:
/// :clock1:
/// :pencil:
/// :telephone_receiver:
/// :inbox_tray:
/// :white_square_button:
/// :mortar_board:
/// :vhs:
/// :japanese_ogre:
/// :mega:
/// :monkey:
/// :waxing_crescent_moon:
/// :heart_eyes_cat:
/// :tea:
/// :movie_camera:
/// :hatching_chick:
/// :radio_button:
/// :kimono:
/// :fish_cake:
/// :waning_gibbous_moon:
/// :green_book:
/// :penguin:
/// :athletic_shoe:
/// :white_large_square:
/// :camera:
/// :pig:
/// :beer:
/// :moneybag:
/// :four_leaf_clover:
/// :syringe:
/// :busts_in_silhouette:
/// :milky_way:
/// :lantern:
/// :mag:
/// :computer:
/// :soon:
/// :flags:
/// :baby_symbol:
/// :bank:
/// :bike:
/// :loop:
/// :purse:
/// :clock530:
/// :hotsprings:
/// :triangular_flag_on_post:
/// :rainbow:
/// :clock430:
/// :postal_horn:
/// :confounded:
/// :atm:
/// :u7121:
/// :grinning:
/// :arrow_up:
/// :fountain:
/// :horse:
/// :clock330:
/// :capricorn:
/// :arrow_forward:
/// :beginner:
/// :meat_on_bone:
/// :currency_exchange:
/// :heavy_exclamation_mark:
/// :point_up:
/// :heavy_check_mark:
/// :ram:
/// :straight_ruler:
/// :hibiscus:
/// :smoking:
/// :fallen_leaf:
/// :stars:
/// :keycap_ten:
/// :oncoming_automobile:
/// :sparkler:
/// :fearful:
/// :aries:
/// :ribbon:
/// :flashlight:
/// :electric_plug:
/// :art:
/// :bee:
/// :name_badge:
/// :bowling:
/// :warning:
/// :bow:
/// :black_medium_small_square:
/// :crescent_moon:
/// :newspaper:
/// :white_circle:
/// :steam_locomotive:
/// :bath:
/// :black_large_square:
/// :fish:
/// :symbols:
/// :signal_strength:
/// :dash:
/// :snowman:
/// :last_quarter_moon:
/// :earth_asia:
/// :gemini:
/// :ambulance:
/// :kissing_closed_eyes:
/// :octopus:
/// :poop:
/// :sound:
/// :card_index:
/// :clock930:
/// :cry:
/// :dancer:
/// :sleeping:
/// :rice:
/// :neutral_face:
/// :sunglasses:
/// :shower:
/// :light_rail:
/// :collision:
/// :musical_score:
/// :trident:
/// :watermelon:
/// :rotating_light:
/// :kiss:
/// :bug:
/// :mailbox_with_mail:
/// :scream_cat:
/// :shoe:
/// :red_car:
/// :no_pedestrians:
/// :blue_car:
/// :nail_care:
/// :fried_shrimp:
/// :man_with_gua_pi_mao:
/// :blue_heart:
/// :tanabata_tree:
/// :satellite:
/// :princess:
/// :clock12:
/// :hamster:
/// :shit:
/// :u55b6:
/// :bomb:
/// :tshirt:
/// :arrow_upper_left:
/// :id:
/// :soccer:
/// :negative_squared_cross_mark:
/// :small_red_triangle:
/// :envelope_with_arrow:
/// :black_square_button:
/// :football:
/// :laughing:
/// :tropical_fish:
/// :rat:
/// :first_quarter_moon:
/// :u6708:
/// :bar_chart:
/// :heavy_minus_sign:
/// :european_castle:
/// :alien:
/// :ferris_wheel:
/// :spades:
/// :person_with_blond_hair:
/// :two_hearts:
/// :pig2:
/// :strawberry:
/// :mountain_railway:
/// :clock6:
/// :leopard:
/// :tiger:
/// :open_book:
/// :feet:
/// :o2:
/// :wc:
/// :tiger2:
/// :triumph:
/// :arrow_up_down:
/// :ledger:
/// :police_car:
/// :bus:
/// :tennis:
/// :fax:
/// :back:
/// :kissing_smiling_eyes:
/// :baseball:
/// :bamboo:
/// :pill:
/// :calling:
/// :two_men_holding_hands:
/// :oncoming_police_car:
/// :tada:
/// :arrow_upper_right:
/// :chart_with_upwards_trend:
/// :eggplant:
/// :gun:
/// :boot:
/// :book:
/// :hammer:
/// :abc:
/// :door:
/// :thought_balloon:
/// :boom:
/// :package:
/// :no_bell:
/// :phone:
/// :u5272:
/// :house_with_garden:
/// :full_moon_with_face:
/// :green_heart:
/// :clubs:
/// :file_folder:
/// :taxi:
/// :city_sunset:
/// :dango:
/// :smiley_cat:
/// :hear_no_evil:
/// :m:
/// :new_moon_with_face:
/// :weary:
/// :small_orange_diamond:
/// :clock5:
/// :tv:
/// :lipstick:
/// :left_luggage:
/// :passport_control:

pub const Error = error{
    Null
};

/// Substituting emoji codes for emoji.
/// 
/// Example:
/// * *
/// const std = @import("std");
/// const lib = @import("emojicons");
/// 
/// pub fn main() !void {
///     const data = try lib.emojiFormatter("Hello World :smile:");
///     defer lib.free(data);
///     std.debug.print("{s}\n", .{data});
/// }
/// * *
/// 
/// @param str
/// @return Slice of bytes
pub fn emojiFormatter(str: []const u8) Error![]u8 {
    const res = emojicons_emoji_formatter(str.ptr);
    if (res == null) {
        return Error.Null;
    }
    return std.mem.span(res);
}

/// function to free the memory after using emojicons functions
///
/// @param slice string returned from emojicons functions
pub fn free(slice: []u8) void {
    emojicons_free(slice.ptr);
}

test {
    const data = try emojiFormatter("Hello World :smile:");
    defer free(data);
    try std.testing.expect(std.mem.eql(u8, "Hello World 😄", data));
}