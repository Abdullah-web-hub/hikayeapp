import List "mo:base/List";
import Option "mo:base/Option";
import Trie "mo:base/Trie";
import Nat32 "mo:base/Nat32";
import Text "mo:base/Text";

actor Hikayeler {


  // Hikaye kimliği tipi
  public type StoryId = Nat32;

  // Karakter tipi
  public type Character = {
    name : Text;
    description : Text;
  };

  // Olay tipi
  public type Event = {
    description : Text;
    result : Text;
  };

  // Ortam tipi
  public type Setting = {
    name : Text;
    description : Text;
  };

  public type Story = {
      name : Text;
      author : Text;
    };

  /**
   * Uygulama Durumu
   */

  // Yeni hikayeler için kimlik
  private stable var next : StoryId = 0;

  // Hikaye verisi depolama alanı
  private stable var stories : Trie.Trie<StoryId, Story> = Trie.empty();

  /**
   * Yüksek Seviye API
   */

  // Yeni hikaye oluşturma
  public func create(story : Story) : async StoryId {
    let storyId = next;
    next += 1;
    stories := Trie.replace(
      stories,
      key(storyId),
      Nat32.equal,
      ?story,
    ).0;
    return storyId;
  };

  // Hikaye okuma
  public query func read(storyId : StoryId) : async ?Story {
    let result = Trie.find(stories, key(storyId), Nat32.equal);
    return result;
  };

  // Hikaye güncelleme
  public func update(storyId : StoryId, story : Story) : async Bool {
    let result = Trie.find(stories, key(storyId), Nat32.equal);
    let exists = Option.isSome(result);
    if (exists) {
      stories := Trie.replace(
        stories,
        key(storyId),
        Nat32.equal,
        ?story,
      ).0;
    };
    return exists;
  };

  // Hikaye silme
  public func delete(storyId : StoryId) : async Bool {
    let result = Trie.find(stories, key(storyId), Nat32.equal);
    let exists = Option.isSome(result);
    if (exists) {
      stories := Trie.replace(
        stories,
        key(storyId),
        Nat32.equal,
        null,
      ).0;
    };
    return exists;
  };

  /**
   * Yardımcı Fonksiyonlar
   */

  // Hikaye kimliği için trie anahtarı oluşturma
  private func key(x : StoryId) : Trie.Key<StoryId> {
    return { hash = x; key = x };
  };
};
