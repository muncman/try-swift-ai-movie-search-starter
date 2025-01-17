//
// Copyright (c) Vatsal Manot
//

import CorePersistence
import NetworkKit

extension OpenAI.APISpecification {
    public enum ResponseBodies {
        
    }
}

extension OpenAI.APISpecification.ResponseBodies {
    public final class CreateEmbedding: OpenAI.List<OpenAI.Embedding> {
        private enum CodingKeys: String, CodingKey {
            case model
            case usage
        }
        
        public let model: OpenAI.Model.Embedding
        public let usage: OpenAI.Usage
        
        public required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.model = try container.decode(forKey: .model)
            self.usage = try container.decode(forKey: .usage)
            
            try super.init(from: decoder)
        }
        
        public override func encode(to encoder: Encoder) throws {
            try super.encode(to: encoder)
            
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(model, forKey: .model)
            try container.encode(usage, forKey: .usage)
        }
    }
    
    public struct CreateChatCompletion: Codable, Hashable {
        public let message: OpenAI.ChatMessage
    }
}
